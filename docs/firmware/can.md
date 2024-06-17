## Input

CAN input format is not restricted or defined by the firmware. 

The handling of CAN inputs is defined by the user using DingoConfigurator. 

!!! Warning
    CAN messages must be received at least every 2 seconds or the input will be set to 0

- *ID*:
    - CAN ID of the message to evaluate 
- *L Byte*:
    - Low byte of the message to evaluate
    - If only one byte, low byte = high byte
- *H Byte*:
    - High byte of the message to evaluate
    - If only one byte, set H Byte to 0
    - Example, 16 bit number at byte 0-1:
        - L Byte = 0
        - H Byte = 1
    - Only 2 bytes are ever used
- *Operator*:
    - Mode `Num`
        - Note: Always momentary
        - `Equal`:
            - Result = Byte value(s) == Mask
        - `GreaterThan`:
            - Result = Byte value(s) > Mask
        - `LessThan`
            - Result = Byte value(s) < Mask
        - `BitwiseAnd`
            - Result = Byte value(s) & Mask
        - `BitwiseNand`
            - Result = !(Byte value(s) & Mask)
    - Mode `Latching` or `Momentary`
        - `BitwiseAnd`
            - Result = Byte value(s) & Mask
        - `BitwiseNand`
            - Result = !(Byte value(s) & Mask)

## Input Examples

- Blink Marine Button 1 (Message 405, byte 0, bit 0)
    - ID = 405
    - L Byte = 0
    - H Byte = 0
    - Operator = BitwiseAnd
    - Mask = 1
    - Mode = Latching or Momentary

- CANBoard Rotary Switch 4 at Position 2, Base ID 0x640 (Message 1602, byte 1 (high nibble))
    - ID = 1600
    - L Byte = 1
    - H Byte = 1
    - Operator = Equal
    - Mask = 32 (2 << 4)
    - Mode = Num

- CANBoard Analog In 2 > 500mV, Base ID 0x650 (Message 1616, byte 2-3)
    - ID = 1616
    - L Byte = 2
    - H Byte = 3
    - Operator = GreaterThan
    - Mask = 500
    - Mode = Num

## Output

dingoPDM sends output, input and device information over CAN (and/or USB) cyclically. 
!!! Note
    Default output transmit is every 50ms (20Hz)

!!! Warning
    The output format is under development and subject to change

| CAN ID     | DLC | Byte 0 | Byte 1 | Byte 2 | Byte 3 | Byte 4 | Byte 5 | Byte 6 | Byte 7|
|:----------:|:---:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:-----:|
|Base ID + 0 | 8   | DI     | DS     | TC     | TC     | BV     | BV     | BT     | BT    |
|Base ID + 1 | 8   | OC1    | OC1    | OC2    | OC2    | OC3    | OC3    | OC4    | OC4   |
|Base ID + 2 | 8   | OC5    | OC5    | OC6    | OC6    | OC7    | OC7    | OC8    | OC8   |
|Base ID + 3 | 8   | OS12   | OS34   | OS56   | OS78   | WO     | WSS    | FIO    |       |
|Base ID + 4 | 8   | OR1    | OR2    | OR3    | OR4    | OR5    | OR6    | OR7    | OR8   |
|Base ID + 5 | 8   | CI     | CI     | CI     | CI     | VI     | VI     |        |       |

- *Base ID + 0*
    - `DI` - Digital Inputs
        - Bit 0 - Input 1
        - Bit 1 - Input 2
    - `DS` - Device State
        - Device State
            - 0 = `Power On`
            - 1 = `Starting`
            - 2 = `Run`
            - 3 = `Sleep`
            - 4 = `Wake Up`
            - 5 = `Overtemp`
            - 6 = `Error`
    - `TC` - Total Current (Amps * 10)
        - 2 bytes
    - `BV` - Battery Voltage (V * 10)
        - 2 bytes
    - `BT` - Board Temperature (deg C * 10)
        - 2 bytes
- *Base ID + 1*
    - `OC1` to `OC4` - Output n Current (Amps * 10)
        - 2 bytes each
- *Base ID + 2*
    - `OC5` to `OC8` - Output n Current (Amps * 10)
        - 2 bytes each
- *Base ID + 3*
    - `OSxy` - Output States x/y
        - Bits 0 to 3 - State x
        - Bits 4 to 8 - State y
            - 0 = `Off`
            - 1 = `On`
            - 2 = `Overcurrent`
            - 3 = `Fault`
    - `WO` - Wiper Outputs
        - Bit 0 - Wiper Slow Speed Output
        - Bit 1 - Wiper Fast Speed Output
    - `WSS` - Wiper State and Speed
        - Bits 0 to 3 - Wiper Speed
            - 0 = `Park`
            - 1 = `Slow`
            - 2 = `Fast`
            - 3 = `Intermittent Speed 1`
            - 4 = `Intermittent Speed 2`
            - 5 = `Intermittent Speed 3`
            - 6 = `Intermittent Speed 4`
            - 7 = `Intermittent Speed 5`
            - 8 = `Intermittent Speed 6`
        - Bits 4 to 8 - Wiper State
            - 0 = `Parked`
            - 1 = `Parking`
            - 2 = `Slow`
            - 3 = `Fast`
            - 4 = `Intermittent Pause`
            - 5 = `Intermittent On`
            - 6 = `Wash`
            - 7 = `Swipe`
    - `FIO` - Flasher Inputs/Outputs
        - Bit 0 - Out 1
        - Bit 1 - Out 2
        - Bit 2 - Out 3
        - Bit 3 - Out 4
        - Bit 4 - Input 1
        - Bit 5 - Input 2
        - Bit 6 - Input 3
        - Bit 7 - Input 4
- *Base ID + 4*
    - `OR1` to `OR8` - Output n Reset Count
- *Base ID + 5*
    - `CI` - CAN Input Results
        - Byte 0 - Inputs 1 to 8
        - Byte 1 - Inputs 9 to 16
        - Byte 2 - Inputs 17 to 24
        - Byte 3 - Inputs 25 to 32
    - `VI` - Virtual Input Results
        - Byte 4 - Inputs 1 to 8
        - Byte 5 - Inputs 9 to 16


## Settings

To change configuration settings on the PDM, settings messages must be sent over CAN (or USB). 

These settings messages have an uppercase letter prefix that is sent in the first byte of the message. 

They must also be sent with a special CAN message ID, Base ID - 1

!!! Warning
    Only messages with the ID = Base ID - 1 will be evaluated for settings changes

For every valid settings message, a response message will be sent back. 

The response message will have a lowercase letter prefix and will respond on ID = Base ID + 30

### CAN

| Type   | DLC | Byte 0 | Byte 1 | Byte 2 | Byte 3 | Byte 4 | Byte 5 | Byte 6 | Byte 7|
|:------:|:---:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:-----:|
|Get     | 1   | C      |        |        |        |        |        |        |       |
|Set     | 5   | C      | SPE    | IDH    | IDL    | TXR    |        |        |       |
|Response| 5   | c      | SPE    | IDH    | IDL    | TXR    |        |        |       |

- `SPE`
    - Bit 0 = CAN enable/disable
        - 0 = `Disable`
        - 1 = `Enable`
    - Bit 1 = CAN transmit enable/disable
        - 0 = `Disable`
        - 1 = `Enable`
    - Bit 4 to 7 = CAN speed
        - 0 = `10K`
        - 1 = `20K`
        - 2 = `50K`
        - 3 = `100K`
        - 4 = `125K`
        - 5 = `250K`
        - 6 = `500K`
        - 7 = `750K`
        - 8 = `1000K`
- `IDH` - Base ID high byte
- `IDL` - Base ID low byte
- `TXR` - Transmit rate, delay between transmit (ms / 10)

### CAN Input

| Type   | DLC | Byte 0 | Byte 1 | Byte 2 | Byte 3 | Byte 4 | Byte 5 | Byte 6 | Byte 7|
|:------:|:---:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:-----:|
|Get     | 2   | N      | NUM    |        |        |        |        |        |       |
|Set     | 7   | N      | OME    | NUM    | IDH    | IDL    | BYT    | MSK    |       |
|Response| 7   | n      | OME    | NUM    | IDH    | IDL    | BYT    | MSK    |       |

- `OME`
    - Bit 0 = Input enable/disable
        - 0 = `Disable`
        - 1 = `Enable`
    - Bit 1 to Bit 2 = Mode
        - 0 = `Num`
        - 1 = `Momentary`
        - 2 = `Latching`
    - Bit 4 to 7 = Operator
        - 0 = `Equal`
        - 1 = `Greater Than`
        - 2 = `Less Than`
        - 3 = `Bitwise And`
        - 4 = `Bitwise Nand`
- `NUM` - Input number
- `IDH` - CAN ID high byte
- `IDL` - CAN ID low byte
- `BYT`
    - Bit 0 to 4 = Low byte
    - Bit 5 to 7 = High byte
- `MSK` - Mask

### Input

| Type   | DLC | Byte 0 | Byte 1 | Byte 2 | Byte 3 | Byte 4 | Byte 5 | Byte 6 | Byte 7|
|:------:|:---:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:-----:|
|Get     | 2   | I      | NUM    |        |        |        |        |        |       |
|Set     | 4   | I      | INS    | DBT    | PUL    |        |        |        |       |
|Response| 4   | i      | INS    | DBT    | PUL    |        |        |        |       |

- `NUM` - Input number
- `INS`
    - Bit 0 = Input enable/disable
        - 0 = `Disable`
        - 1 = `Enable`
    - Bit 1-2 = Mode
        - 0 = `Num`
        - 1 = `Momentary`
        - 2 = `Latching`
    - Bit 3 = Invert input logic
    - Bit 4-7 = Input number
- `DBT` - Debounce time (ms / 10)
- `PUL` - Pullup/pulldown
    - 0 = `No pull`
    - 1 = `Pullup`
    - 2 = `Pulldown`

### Output

| Type   | DLC | Byte 0 | Byte 1 | Byte 2 | Byte 3 | Byte 4 | Byte 5 | Byte 6 | Byte 7|
|:------:|:---:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:-----:|
|Get     | 2   | O      | NUM    |        |        |        |        |        |       |
|Set     | 8   | O      | NUM    | IN     | CL     | RES    | RT     | INL    | INT   |
|Response| 8   | o      | NUM    | IN     | CL     | RES    | RT     | INL    | INT   |

- `NUM`
    - Bit 0 = Output enable/disable
        - 0 = `Disable`
        - 1 = `Enable`
    - Bit 4-7 = Output number
- `IN` - Input number (see [Variable Map](variablemap.md))
- `CL` - Current limit (A)
- `RES`
    - Bit 0-3 = Reset Mode
        - 0 = `None`
        - 1 = `Count`
        - 2 = `Endless`
    - Bit 4-7 = Reset Count Limit
- `RT` - Reset time (ms / 10)
- `INL` - Inrush limit (A)
- `INT` - Inrush time (ms / 10)

### Virtual Input

| Type   | DLC | Byte 0 | Byte 1 | Byte 2 | Byte 3 | Byte 4 | Byte 5 | Byte 6 | Byte 7|
|:------:|:---:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:-----:|
|Get     | 2   | U      | NUM    |        |        |        |        |        |       |
|Set     | 7   | U      | NOT    | NUM    | VR0    | VR1    | VR2    | MDC    |       |
|Response| 7   | u      | NOT    | NUM    | VR0    | VR1    | VR2    | MDC    |       |

- `NUM` - Virtual input number
- `NOT`
    - Bit 0 = Virtual input enable/disable
        - 0 = `Disable`
        - 1 = `Enable`
    - Bit 1 = Not variable 0
        - 0 = `No invert`
        - 1 = `Invert`
    - Bit 2 = Not variable 1
    - Bit 3 = Not variable 2
- `VR0` - Variable 0 (see [Variable Map](variablemap.md))
- `VR1` - Variable 1 (see [Variable Map](variablemap.md))
- `VR2` - Variable 2 (see [Variable Map](variablemap.md))
- `MDC`
    - Bit 0-1 = Condition 0
        - 0 = `And`
        - 1 = `Or`
        - 2 = `Nor`
    - Bit 2-3 = Condition 1
    - Bit 6-7 = Mode
        - 0 = `Num`
        - 1 = `Momentary`
        - 2 = `Latching`

### Flasher

| Type   | DLC | Byte 0 | Byte 1 | Byte 2 | Byte 3 | Byte 4 | Byte 5 | Byte 6 | Byte 7|
|:------:|:---:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:-----:|
|Get     | 2   | H      | NUM    |        |        |        |        |        |       |
|Set     | 6   | H      | NUM    | IN     | OUT    | ON     | OFF    |        |       |
|Response| 6   | h      | NUM    | IN     | OUT    | ON     | OFF    |        |       |

- `NUM`
    - Bit 0 = Flasher enable/disable
        - 0 = `Disable`
        - 1 = `Enable`
    - Bit 1 = Single/continous flash
    - Bit 4-7 = Flasher number
- `IN` - Flasher input (see [Variable Map](variablemap.md))
- `OUT` - Flasher output (see [Variable Map](variablemap.md))
- `ON` - Flash on time (ms / 10)
- `OFF` - Flash off time (ms / 10)

### Wiper

| Type   | DLC | Byte 0 | Byte 1 | Byte 2 | Byte 3 | Byte 4 | Byte 5 | Byte 6 | Byte 7|
|:------:|:---:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:-----:|
|Get     | 1   | W      |        |        |        |        |        |        |       |
|Set     | 8   | W      | CLM    | SIN    | FIN    | IIN    | OIN    | PIN    | WIN   |
|Response| 8   | w      | CLM    | SIN    | FIN    | IIN    | OIN    | PIN    | WIN   |

- `CLM`
    - Bit 0 = Wiper enable/disable
        - 0 = `Disable`
        - 1 = `Enable`
    - Bit 1-2 = Mode
        - 0 = `Dig` Digital inputs for speed
            - Must use at least `Slow` and `Park` inputs
            - `Fast` and `Intermittent` inputs optional
        - 1 = `Int` Integer speed input to select slow/fast/intermittent/park. Digital input for park
            - One speed input value must be park (`0`)
            - Must use `Speed` and `Park` inputs
            - Use case: Rotary switch to select wiper on/speed
        - 2 = `Mix` Integer input for slow/fast/intermittent. Digital inputs for on and park
            - Must use `Speed`, `On` and `Park` input
            - Use case: Rotary switch to select speed, latching button to turn wipers on/off
    - Bit 3 = Park level
        - 0 = Stop when input is low
        - 1 = Stop when input is high
    - Bit 4-7 = Wash cycles count, number of swipes after wash
- `SIN` - Slow speed input (see [Variable Map](variablemap.md))
- `FIN` - Fast speed input (see [Variable Map](variablemap.md))
- `IIN` - Intermittent speed input (see [Variable Map](variablemap.md))
- `OIN` - On input (see [Variable Map](variablemap.md))
- `PIN` - Park input (see [Variable Map](variablemap.md))
- `WIN` - Wash input (see [Variable Map](variablemap.md))

!!! Bug
    `Mode` = `Dig` is the only mode that is currently supported.  

### Wiper Speed

| Type   | DLC | Byte 0 | Byte 1 | Byte 2 | Byte 3 | Byte 4 | Byte 5 | Byte 6 | Byte 7|
|:------:|:---:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:-----:|
|Get     | 1   | P      |        |        |        |        |        |        |       |
|Set     | 7   | P      | SWI    | SPI    | S01    | S23    | S45    | S67    |       |
|Response| 7   | p      | SWI    | SPI    | S01    | S23    | S45    | S67    |       |

- `SWI` - Swipe input (see [Variable Map](variablemap.md))
- `SPI` - Speed integer input (see [Variable Map](variablemap.md))
- `S01`
    - Bit 0-3 = Speed map 0
    - Bit 4-7 = Speed map 1 
- `S23`
    - Bit 0-3 = Speed map 2
    - Bit 4-7 = Speed map 3
- `S45`
    - Bit 0-3 = Speed map 4
    - Bit 4-7 = Speed map 5
- `S67`
    - Bit 0-3 = Speed map 6
    - Bit 4-7 = Speed map 7
- Speed map values are used when `Mode` is set to `Int` or `Mix`
- The values of the speed map correspond to different speeds/states when the `Speed` input has that value
    - 0 = `Park`
    - 1 = `Slow`
    - 2 = `Fast`
    - 3 = `Intermittent 0`
    - 4 = `Intermittent 1`
    - 5 = `Intermittent 2`
    - 6 = `Intermittent 3`
    - 7 = `Intermittent 4`
    - 8 = `Intermittent 5`

### Wiper Delay

| Type   | DLC | Byte 0 | Byte 1 | Byte 2 | Byte 3 | Byte 4 | Byte 5 | Byte 6 | Byte 7|
|:------:|:---:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:-----:|
|Get     | 1   | Y      |        |        |        |        |        |        |       |
|Set     | 7   | Y      | IT0    | IT1    | IT2    | IT3    | IT4    | IT5    |       |
|Response| 7   | y      | IT0    | IT1    | IT2    | IT3    | IT4    | IT5    |       |

- `ITn` - Wiper intermittent time (ms / 1000)

### Starter Disable

| Type   | DLC | Byte 0 | Byte 1 | Byte 2 | Byte 3 | Byte 4 | Byte 5 | Byte 6 | Byte 7|
|:------:|:---:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:-----:|
|Get     | 1   | D      |        |        |        |        |        |        |       |
|Set     | 4   | D      | EN     | IN     | OUT    |        |        |        |       |
|Response| 4   | d      | EN     | IN     | OUT    |        |        |        |       |

- `EN`
    - Bit 0 = Starter disable enable/disable
        - 0 = `Disable`
        - 1 = `Enable`
- `IN` - Starter disable input (see [Variable Map](variablemap.md))
- `OUT` - Starter disable outputs
    - Bit 0 = Output 1
    - Bit n = Output n+1
    - Bit 7 = Output 8

## Special

There are some special messages that are used for special functions. 

### Burn

The burn message triggers the PDM to save the configuration to FRAM memory. 

Without this message, any settings change will be lost on a power cycle

A response will be sent with the result of the Burn

| Type   | DLC | Byte 0 | Byte 1 | Byte 2 | Byte 3 | Byte 4 | Byte 5 | Byte 6 | Byte 7|
|:------:|:---:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:-----:|
|Get     | 4   | B      | 1      | 3      | 8      |        |        |        |       |
|Response| 2   | b      | OK     |        |        |        |        |        |       |

!!! Tip
    This is an easy way to test new settings. Try new settings without Burn and then cycle power to restore the old settings

### Sleep

The sleep message triggers the PDM to immediately go to sleep. 

| Type   | DLC | Byte 0 | Byte 1 | Byte 2 | Byte 3 | Byte 4 | Byte 5 | Byte 6 | Byte 7|
|:------:|:---:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:-----:|
|Get     | 4   | Q      | U      | I      | T      |        |        |        |       |
|Response| 2   | q      | OK     |        |        |        |        |        |       |

!!! Note
    This message will not have an effect if the sleep conditions are not met, see Sleep

### Wake Up

This message triggers the PDM to wake up from sleep.

There is no response to this message.

!!! Tip
    The format of this message is not critical, any CAN message will wake the PDM

### Version

This message gets the firmware version

| Type   | DLC | Byte 0 | Byte 1 | Byte 2 | Byte 3 | Byte 4 | Byte 5 | Byte 6 | Byte 7|
|:------:|:---:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:-----:|
|Get     | 1   | V      |        |        |        |        |        |        |       |
|Response| 5   | v      | MA     |  MI    |  BH    |  BL    |        |        |       |

- `MA` - Major
- `MI` - Minor
- `BH` - Build High Byte
- `BL` - Build Low Byte


## Messages

Periodically, the device will send info, warning or error messages to facilitate debugging. 

These messages will have the format below. 

The first byte is a message type, the second is the ID number and 3rd-5th are extra integer parameters that are added to some messages. 

| Type   | DLC | Byte 0 | Byte 1 | Byte 2 | Byte 3 | Byte 4 | Byte 5 | Byte 6 | Byte 7|
|:------:|:---:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:-----:|
|Info    | 5   | F      | SRC    |  N1    |  N2    | N3     |        |        |       |
|Warning | 5   | R      | SRC    |  N1    |  N2    | N3     |        |        |       |
|Error   | 5   | E      | SRC    |  N1    |  N2    | N3     |        |        |       |

- `SRC` - Source, see table below
- `N1` - Integer parameter
- `N2` - Integer parameter
- `N3` - Integer parameter

#### Errors

Errors messages are sent when a non-recoverable issue occurs.

The only way to reset is to cycle power on the device. 

### Source

| SRC Num| Description       | Parameter 1 | Parameter 2    | Parameter 3 | Description                     |
|:------:|:-----------------:|:-----------:|:--------------:|:-----------:|---------------------------------|
| 1      | State Power On    |             |                |             | Device is in it's initial state |
| 2      | State Starting    |             |                |             | Initializing peripherals        |
| 3      | State Run         |             |                |             | Normal operating state          |
| 4      | State Over Temp   | Temp (C*10) |                |             | Board temp > Max, outputs off   |
| 5      | State Error       |             |                |             | Fatal error, power cycle        |
| 6      | State Sleep       |             |                |             | Low power sleep, no activity    |
| 7      | State Wake        |             |                |             | Wake from low power sleep       |
| 8      | Overcurrent       | Output Num  | Current (A*10) |             | Overcurrent on output           |
| 10     | Battery Voltage   | Volts (V*10)|                |             | Battery voltage under/over      |
| 11     | CAN               |             |                |             | CAN warning or error            |
| 12     | USB               |             |                |             | USB warning or error            |
| 13     | Over Temperature  | Temp (C*10) |                |             | Board temp warning or error     |
| 14     | Configuration     |             |                |             | Device config init error        |
| 15     | FRAM              |             |                |             | FRAM init error                 |
| 16     | ADC               |             |                |             | ADC DMA init error              |
| 17     | I2C               |             |                |             | I2C init error                  |
| 18     | Temperature Sensor|             |                |             | Temperature sensor init error   |
| 19     | USB Connected     |             |                |             | USB cable connection detected   |