# Design

## Device State

dingoPDM uses a simple state machine to control overtemperature, sleep and error behavior. 

``` mermaid
stateDiagram
    [*] --> Run : Power On
    Run --> OverTemp : Temp > Max
    OverTemp --> Run : Temp < Max
    Run --> Sleep : Timeout
    Sleep --> Run : Activity
    Run --> Error : Error
    OverTemp --> Error : Temp > Critical
    Error --> [*] : Power Cycle Required
```

See [Sleep](./sleep.md) for information on the sleep timeout and wake

See [Errors](./errors.md) for information on possible fatal errors

See [LEDs](./leds.md) for possible status and error LED states

- `Run`
    - Default state
- `Sleep`
    - All outputs off
    - Low power state
- `OverTemp`
    - Temperature sensor mounted to PCB over max temp
    - Warning message sent
    - Outputs remain on
- `Error`
    - Fatal error state, power cycle required to recover



## Files

dingoPDM firmware files can be divided between ChibiOS, OpenOCD and dingoPDM specific files

### ChibiOS

- cfg/ 
    - ChibiOS configuration files
- ChibiOS/
    - ChibiOS repository files
- boards/./board (.h / .c / .mk)
    - ChibiOS configuration files
    - Unique between dingoPDM and dingoPDM-Max
  
### OpenOCD

- interface/
    - ST Link debug interface
- target/
    - STM32F4 debug configuration
  
### dingoPDM

#### Folders

- boards/
    - dingoPDM and dingoPDM-Max specific config and utils
    - hw_devices
        - 
- boards/cortex-m4/
    - MCU specific utils (stop/bootloader)
- devices/ 
    - External devices (future)
- hardware/
    - Onboard hardware devices (FRAM/temperature)
- keypad/
    - CAN keypads
- wiper/
    - Wiper function

#### Declaration

| File            |                                     |
| :-------------- | :---------------------------------- |
| dingopdm_config | FW version / delays / limits / etc. |
| enums           | All enum declarations               |

#### Entry Point

| File |                          |
| :--- | :----------------------- |
| main | Init ChibiOS + start PDM |

#### PDM Main

| File |                |
| :--- | :------------- |
| pdm  | Main PDM logic |

#### Hardware

| File |                                  |
| :--- | :------------------------------- |
| can  | CAN Tx/Rx - Post/Fetch Mailboxes |
| led  | Status/Error LEDs                |
| usb  | USB Tx/Rx - Post/Fetch Mailboxes |

#### Configuration 

| File           |                           |
| :------------- | :------------------------ |
| config_handler | Process setting change    |
| config         | Read/Write config in FRAM |
 
#### Functions

| File          |                                     |
| :------------ | :---------------------------------- |
| can_input     | CAN Rx decoding / logic             |
| condition     | Condition logic                     |
| counter       | Counter logic                       |
| digital       | Digital input logic                 |
| flasher       | Flasher logic                       |
| input         | Momentary/latching logic            |
| profet        | Output logic + current measurement  |
| pwm           | Output Pulse Width Modulation logic |
| starter       | Starter disable logic               |
| virtual_input | Virtual input logic                 |

#### Utilities

| File    |                               |
| :------ | :---------------------------- |
| crc     | Calculate CRC                 |
| edge    | Detect edge - rising/falling  |
| error   | Fatal error - Flash LED       |
| mailbox | CAN/USB Tx/Rx mailbox buffers |
| msg     | Status Tx messages            |
           


