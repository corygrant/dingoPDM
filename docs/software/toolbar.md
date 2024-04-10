![ToolBar](../images/toolbar.jpg){ width="800" }

The ToolBar is divided into 3 sections:

* `File Operations`

* `Interface Connection`

* `Settings Communication`

!!! Note
    The sections of the ToolBar can be rearranged by dragging the sections using the handle on the left of each section

## Keyboard Shortcuts

| Function   | Key        |
| --------   | ---------  |
| New        | ++ctrl+n++ |
| Open       | ++ctrl+o++ |
| Save       | ++ctrl+s++ |
| Refresh    | ++ctrl+r++ |
| Connect    | ++ctrl+c++ |
| Disconnect | ++ctrl+d++ |
| Upload     | ++ctrl+u++ |
| Download   | ++ctrl+w++ |
| Burn       | ++ctrl+b++ |

## File Operations

DingoConfigurator uses standard `JSON` configuration files with the extension `.dco`. 

The modified extension enables setting the Windows default app to DingoConfigurator.

!!! warning
    Do not edit the `.dco` file outside of DingoConfigurator unless you are familiar with `JSON`. 

    Errors will make the file unusable with DingoConfigurator. 

### New

`New` clears the current configuration.

No file is created, just a new clean configuration. 

After adding new devices, press `Save As` to save the new `.dco` file. 

!!! warning
    Save the current configuration before pressing `New` to prevent losing the current configuration settings

### Open

`Open` launches a file dialog to select a `.dco` file. 

The directory will repeat to the same directory as previously used after the first use. 

!!! warning
    `Open` clears the current configuration, `Save` before pressing `Open` to prevent losing the current configuration settings

### Save

`Save` saves the `.dco` file after an `Open` or `Save As`

### Save As

`Save As` saves a new `.dco` file from a new configuration or saves a copy of an existing configuration


## Interface Connection

### Interfaces

Select the interface to connect to the devices. 

Currently supported interfaces:

| Interface |
| --------  |
| USB2CAN   |
| PCAN      |
| USB       |

!!! Note
    USB only allows connection to one device at a time, versus CAN which connects to all devices on the bus

### Port

Select the COM port to use with the selected interface, if required. 

`PCAN` does not require a COM port, therefore the port selection is disabled when `PCAN` is selected.

### Refresh

`Refresh` updates the `Port` selection with the current list of available COM ports. 

### Baud

Select the required CAN baud rate. 

`USB` does not require a baud rate, therefore the baud rate selection is disabled when `USB` is selected. 

### Connect

`Connect` opens a connection to the interface device.

After a successful connection, the StatusBar at the bottom of the window should update with a green box and the name of the interface followed by "Connected".

The StatusBar will also update with the number of Detected Devices in the bottom right. 

!!! Tip
    The Detected Devices count means messages in the range of the configured devices are being received.

    For each device the count is increased by 1 

### Disconnect

`Disconnect` closes the currently open connection. 

## Settings Communication

The `Settings Communication` section of the ToolBar enables uploading, downloading and burning the configuration to the currently selected Device. 

!!! Tip
    To enable the buttons, select a device in the DeviceTree. 

!!! Note
    Some devices do not support settings communication, therefore the buttons are disabled. 

### Upload

`Upload` reads the settings from the selected device and updates the current configuration. 

!!! Warning
    `Upload` will overwrite the current configuration settings for the selected device

### Download 

`Download` sends the current configuration to the selected device. 


### Burn

`Burn` sends a burn command to the selected device. 

This command tells the device to write the current configuration to non-volatile memory. 

!!! Danger
    If a `Burn` is not performed after a `Download` the current configuration in the device will be lost on a power cycle
