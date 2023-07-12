## hotas_ctrl.ps1

The Thrustmaster Warthog HOTAS device can sometimes prevent Windows from putting the monitors to sleep, resulting in the screens staying active even when idle. To address this issue, I created hotas_ctrl, a PowerShell script designed to enable and disable the Thrustmaster HOTAS device as needed.

hotas_ctrl provides a convenient solution to toggle the status of the Warthog HOTAS device, allowing you to easily enable or disable it based on your requirements. By using the provided scheduled tasks in XML format, you can automate the execution of the script using the Windows Task Scheduler.

**Note: Administrative privileges are required to execute the script and configure the scheduled tasks. Please ensure that the user running the script has administrative privileges.**

### Features and Usage

- Enable or disable the Thrustmaster Warthog HOTAS device with a simple command.
- Import the provided scheduled tasks in XML format into the Windows Task Scheduler for automatic execution.
- Ensure that the monitors can go to sleep when the Warthog HOTAS device is disabled, conserving energy and preventing screen burn-in.

### How to Use

1. Download the hotas_ctrl.ps1 script to your computer.
2. Import the provided scheduled tasks in XML format into the Windows Task Scheduler.
3. Customize the scheduled tasks as needed, adjusting the script file path and any additional settings.
4. Run the scheduled tasks or execute the hotas_ctrl.ps1 script manually when you want to enable or disable the Warthog HOTAS device.

**Note: Ensure that the user running the script or scheduled tasks has administrative privileges to perform the necessary operations.**

### Disclaimer

hotas_ctrl.ps1 and the associated scheduled tasks are provided as-is without any warranty. Use them at your own risk. The author and contributors are not responsible for any damages or issues caused by the usage of this script or the scheduled tasks.
