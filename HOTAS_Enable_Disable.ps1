# Get user parameters
param (
    [Parameter()]
    [ValidateSet("enable", "disable")]
    [String]$action
)

$registryPath = "HKLM:\SYSTEM\CurrentControlSet\Control\MediaProperties\PrivateProperties\Joystick\OEM"

#Fetching Device ID's from registry. 
$childKeys = Get-ChildItem -Path $registryPath -Recurse |
    Where-Object { $_.Property -match "OEMName" -and $_.GetValue("OEMName") -like "*HOTAS Warthog*" }

if ($childKeys) {
    Write-Host "Warhog HOTAS found in registry"
    foreach ($key in $childKeys) {
        $instanceID = $key.PSChildName

        # Search for matching PnP HID devices with the same InstanceID
        $pnpDevices = Get-PnpDevice |
            Where-Object { $_.InstanceID -like "*$instanceID*" -and $_.InstanceID -like "HID*" }

        if ($pnpDevices) {
            Write-Host "HID Device found"
            foreach ($device in $pnpDevices) {
                $deviceId = $device.InstanceID

                if ($action) {
                    if ($action -eq "enable") {
                        Write-Host "Enabling device $deviceId"
                        Enable-PnpDevice -InstanceId $deviceId -Confirm:$false
                    } else {
                        Write-Host "Disabling device $deviceId"
                        Disable-PnpDevice -InstanceId $deviceId -Confirm:$false
                    }
                } else {
                    # Get status of the device
                    switch ($device.Status) {
                        # If status is 'OK', disable it
                        'OK' {
                            Write-Host "Device $deviceId is enabled"
                            Write-Host "Disabling device $deviceId"
                            Disable-PnpDevice -InstanceId $deviceId -Confirm:$false
                            break
                        }
                        # If status is 'default', enable it
                        default {
                            Write-Host "Device $deviceId is disabled"
                            Write-Host "Enabling device $deviceId"
                            Enable-PnpDevice -InstanceId $deviceId -Confirm:$false
                        }
                    }
                }
            }
        } else {
            Write-Host "No matching HID devices found for $instanceID."
        }
    }
} else {
    Write-Host "No registry keys found with OEMName containing 'HOTAS Warthog'."
}
