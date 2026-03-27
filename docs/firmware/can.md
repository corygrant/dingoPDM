!!! Info
    To reduce complexity, USB uses the same message format as CAN

    dingoPDM sends the same messages over CAN and USB 
    
    dingoPDM can also receive the same settings change messages over USB

    There is no difference in message formatting between CAN and USB

## DBC

DBC files can be found in the firmware repo [here](https://github.com/corygrant/DingoPDM_FW/tree/master/dbc)

!!! Info
    DBC files are built using the python dbc_builder in the `dbc_builder` folder

## Input

CAN input format is not restricted or defined by the firmware. 

The handling of CAN inputs is defined by the user using DingoConfigurator. 

!!! Warning
        If timeout is enabled, CAN messages must be received at least every timeout interval or the input will be set to 0

- *ID*:
    - CAN ID of the message to evaluate 
    - 11-bit standard IDs and 29-bit extended IDs are valid
- *Start Byte*:
    - First byte of the message to evaluate
- *# Bytes*:
    - 1 or 2 bytes
    - Number of bytes to evaluate
- *Operator*:
    - `Equal`:
        - Result = Byte value(s) == Arg
    - `Not Equal`:
        - Result = Byte value(s) != Arg
    - `Greater Than`:
        - Result = Byte value(s) > Arg
    - `Less Than`
        - Result = Byte value(s) < Arg
    - `Greater Than or Equal`:
        - Result = Byte value(s) >= Arg
    - `Less Than or Equal`
        - Result = Byte value(s) <= Arg
    - `BitwiseAnd`
        - Result = Byte value(s) & Arg
    - `BitwiseNand`
        - Result = !(Byte value(s) & Arg)
- *Mode*:
    - `Momentary`
        - Result true when message solves to true
    - `Latching`
        - Result transitions between true/false when message solves to true
- *Timeout*:
    - `Enable`
        - When enabled, messages must be received before the timeout expires
        - If the timeout expires, the result will be false
  
## Input Examples

- Blink Marine Button 1 (Message 405, byte 0, bit 0)
    - ID = 405
    - Start Byte = 0
    - Num Bytes = 1
    - Operator = BitwiseAnd
    - Arg = 1
    - Mode = Latching or Momentary

- CANBoard Rotary Switch 4 at Position 2, Base ID 0x640 (Message 1602, byte 1 (high nibble))
    - ID = 1600
    - Start Byte = 1
    - Num Bytes = 1
    - Operator = Equal
    - Arg = 32 = (2 << 4)
    - Mode = Momentary

- CANBoard Analog In 2 > 500mV, Base ID 0x650 (Message 1616, byte 2-3)
    - ID = 1616
    - Start Byte = 2
    - Num Bytes = 2
    - Operator = GreaterThan
    - Arg = 500
    - Mode = Momentary

## Output

dingoPDM sends output, input and device information over CAN (and/or USB) cyclically. 
!!! Note
    Default output transmit is every 100ms (10Hz)

!!! Warning
    The output format is under development and subject to change

!!! Note
    Messages not marked as always sent are only sent when their contents are enabled


| Always Sent   | CAN ID     | DLC | Byte 0 | Byte 1 | Byte 2 | Byte 3 | Byte 4 | Byte 5 | Byte 6 | Byte 7|
| :-----------: |:----------:|:---:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:-----:|
|:green_square: |Base ID + 0 | 8   | DI     | DS     | TC     | TC     | BV     | BV     | BT     | BT    |
|:green_square: |Base ID + 1 | 8   | OC1    | OC1    | OC2    | OC2    | OC3    | OC3    | OC4    | OC4   |
|:green_square: |Base ID + 2 | 8   | OC5    | OC5    | OC6    | OC6    | OC7    | OC7    | OC8    | OC8   |
|:green_square: |Base ID + 3 | 8   | OS12   | OS34   | OS56   | OS78   | WO     | WSS    | FIO    | 0     |
|:green_square: |Base ID + 4 | 8   | OR1    | OR2    | OR3    | OR4    | OR5    | OR6    | OR7    | OR8   |
|               |Base ID + 5 | 8   | CI     | CI     | CI     | CI     | VI     | VI     | 0      | 0     |
|               |Base ID + 6 | 8   | CNT1   | CNT2   | CNT3   | CNT4   | CON    | CON    | CON    | CON   |
|               |Base ID + 7 | 8   | CIV1   | CIV1   | CIV2   | CIV2   | CIV3   | CIV3   | CIV4   | CIV4  |
|               |Base ID + 8 | 8   | CIV5   | CIV5   | CIV6   | CIV6   | CIV7   | CIV7   | CIV8   | CIV8  |
|               |Base ID + 9 | 8   | CIV9   | CIV9   | CIV10  | CIV10  | CIV11  | CIV11  | CIV12  | CIV12 |
|               |Base ID + 10| 8   | CIV13  | CIV13  | CIV14  | CIV14  | CIV15  | CIV15  | CIV16  | CIV16 |
|               |Base ID + 11| 8   | CIV17  | CIV17  | CIV18  | CIV18  | CIV19  | CIV19  | CIV20  | CIV20 |
|               |Base ID + 12| 8   | CIV21  | CIV21  | CIV22  | CIV22  | CIV23  | CIV23  | CIV24  | CIV24 |
|               |Base ID + 13| 8   | CIV25  | CIV25  | CIV26  | CIV26  | CIV27  | CIV27  | CIV28  | CIV28 |
|               |Base ID + 14| 8   | CIV29  | CIV29  | CIV30  | CIV30  | CIV31  | CIV31  | CIV32  | CIV32 |
|               |Base ID + 15| 8   | ODC1   | ODC2   | ODC3   | ODC4   | ODC5   | ODC6   | ODC7   | ODC8  |
|               |Base ID + 16| 8   | K1B1   | K1B2   | K1B3   | K2B1   | K2B2   | K2B3   | 0      | 0     |
|               |Base ID + 17| 8   | K1D1   | K1D1   | K1D2   | K1D2   | K1D3   | K1D3   | K1D4   | K1D4  |
|               |Base ID + 18| 8   | K2D1   | K2D1   | K2D2   | K2D2   | K2D3   | K2D3   | K2D4   | K2D4  |

- *Base ID + 0*
    - `DI` - Digital Inputs
        - Bit 0 - Input 1
        - Bit 1 - Input 2
    - `DS` - Device State
        - Bits 0 to 3
            - Device State
                - 0 = `Run`
                - 1 = `Sleep`
                - 2 = `Overtemp`
                - 3 = `Error`
        - Bits 4 to 7
            - PDM Type
                - 0 = dingoPDM
                - 1 = dingoPDM-Max
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
- *Base ID + 6*
    - `CNT1` to `CNT4` - Counter Values
    - `CON` - Condition Results
        - Byte 4 - Conditions 0 to 8
        - Byte 5 - Conditions 9 to 16
        - Byte 6 - Conditions 17 to 24
        - Byte 7 - Conditions 25 to 32
- *Base ID + 7* TO *Base ID + 14*
    - `CIV1` to `CIV32` - CAN Input Values
        - 2 bytes each
- *Base ID + 15*
    - `ODC1` to `ODC8` - Output Duty Cycle (%)
- *Base ID + 16*
    - `K1B1` - Keypad 1 Buttons 1-8
    - `K1B2` - Keypad 1 Buttons 9-16
    - `K1B3` - Keypad 1 Buttons 17-20
    - `K2B1` - Keypad 2 Buttons 1-8
    - `K2B2` - Keypad 2 Buttons 9-16
    - `K2B3` - Keypad 2 Buttons 17-20
- *Base ID + 17*
    - `K1D1` - Keypad 1 Dial 1 Ticks
    - `K1D2` - Keypad 1 Dial 2 Ticks
    - `K1D3` - Keypad 1 Dial 3 Ticks
    - `K1D4` - Keypad 1 Dial 4 Ticks
- *Base ID + 18*
    - `K2D1` - Keypad 2 Dial 1 Ticks
    - `K2D2` - Keypad 2 Dial 2 Ticks
    - `K2D3` - Keypad 2 Dial 3 Ticks
    - `K2D4` - Keypad 2 Dial 4 Ticks

## Settings

To change configuration settings on the PDM, settings messages must be sent over CAN (or USB). 

These settings messages have a prefix that is sent in the first byte of the message. 

They must also be sent with a special CAN message ID, Base ID - 1

!!! Warning
    Only messages with the ID = Base ID - 1 will be evaluated for settings changes

For every valid settings message, a response message will be sent back. 

The response message will be the prefix + 128 and will respond on ID = Base ID + 30

| Setting                               | Prefix    | Response  |
|:--------------------------------------|:---------:|:---------:|
|[`CAN`](#can)                          | ***1***   | ***129*** |
|[`Inputs`](#input)                     | ***5***   | ***133*** |
|[`Outputs`](#output)                   | ***10***  | ***138*** |
|[`Outputs PWM`](#output-pwm)           | ***11***  | ***139*** |
|[`Virtual Inputs`](#virtual-input)     | ***15***  | ***143*** |
|[`Wiper`](#wiper)                      | ***20***  | ***148*** |
|[`Wiper Speed`](#wiper-speed)          | ***21***  | ***149*** |
|[`Wiper Delays`](#wiper-delay)         | ***22***  | ***150*** |
|[`Flashers`](#flasher)                 | ***25***  | ***153*** |
|[`Starter Disable`](#starter-disable)  | ***30***  | ***158*** |
|[`CAN Inputs`](#can-input)             | ***35***  | ***163*** |
|[`CAN Inputs IDs`](#can-input-id)      | ***36***  | ***164*** |
|[`Counters`](#counter)                 | ***40***  | ***168*** |
|[`Conditions`](#condition)             | ***45***  | ***173*** |
|[`Version Info`](#version)             | ***120*** | ***248*** |
|[`Sleep`](#sleep)                      | ***121*** | ***249*** |
|[`Enter Bootloader`](#bootloader)      | ***125*** | ***253*** |
|[`Burn Settings`](#burn)               | ***127*** | ***255*** |

### CAN

| Type   | DLC | Byte 0 | Byte 1 | Byte 2 | Byte 3 | Byte 4 | Byte 5 | Byte 6 | Byte 7|
|:------:|:---:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:-----:|
|Get     | 1   | 1      |        |        |        |        |        |        |       |
|Set     | 4   | 1      | SPE    | IDH    | IDL    |        |        |        |       |
|Response| 4   | 129    | SPE    | IDH    | IDL    |        |        |        |       |

- `SPE`
    - Bit 0 = Sleep enable/disable
        - 0 = `Disable`
        - 1 = `Enable`
    - Bit 1 = CAN filters enable/disable
        - 0 = `Disable`
        - 1 = `Enable`
    - Bit 4 to 7 = CAN speed
        - 0 = `1000K`
        - 1 = `500K`
        - 2 = `250K`
        - 3 = `125K`
- `IDH` - Base ID high byte
- `IDL` - Base ID low byte



### Input

| Type   | DLC | Byte 0 | Byte 1 | Byte 2 | Byte 3 | Byte 4 | Byte 5 | Byte 6 | Byte 7|
|:------:|:---:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:-----:|
|Get     | 2   | 5      | NUM    |        |        |        |        |        |       |
|Set     | 4   | 5      | INS    | DBT    | PUL    |        |        |        |       |
|Response| 4   | 133    | INS    | DBT    | PUL    |        |        |        |       |

- `NUM` - Input number
- `INS`
    - Bit 0 = Input enable/disable
        - 0 = `Disable`
        - 1 = `Enable`
    - Bit 1-2 = Mode
        - 0 = `Momentary`
        - 1 = `Latching`
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
|Get     | 2   | 10     | NUM    |        |        |        |        |        |       |
|Set     | 8   | 10     | NUM    | IN     | CL     | RES    | RT     | INL    | INT   |
|Response| 8   | 138    | NUM    | IN     | CL     | RES    | RT     | INL    | INT   |

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

### Output PWM

| Type   | DLC | Byte 0 | Byte 1 | Byte 2 | Byte 3 | Byte 4 | Byte 5 | Byte 6 | Byte 7|
|:------:|:---:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:-----:|
|Get     | 2   | 11     | NUM    |        |        |        |        |        |       |
|Set     | 8   | 11     | NUM    | IN     | FRQ    | FDC    | SSR    | SSR    | DCI   |
|Response| 8   | 139    | NUM    | IN     | FRQ    | FDC    | SSR    | SSR    | DCI   |

- `NUM`
    - Bit 0 = PWM enable/disable
        - 0 = `Disable`
        - 1 = `Enable`
    - Bit 1 = Soft start enable/disable
        - 0 = `Disable`
        - 1 = `Enable`
    - Bit 2 = Variable duty cycle
        - 0 = `Fixed duty cycle`
        - 1 = `Variable duty cycle` 
    - Bit 4-7 = Output number
- `IN` - Duty cycle input number (see [Variable Map](variablemap.md))
    - CAN Input Values are the only valid inputs
    - All other input values are boolean
- `CL` - Current limit (A)
- `FRQ`- PWM base frequency (Hz)
    - 9 bit value
    - Bits 1-8 in Byte 3
    - Bit 0 in `FDC`
- `FDC` - Fixed duty cycle (%)
    - Bit 0 = PWM base frequency bit 0
    - Bits 1-8 = Fixed duty cycle
- `SSR` - Soft start ramp time (ms)
- `DCI` - Duty cycle denominator
    - 0 to 255
    - `IN` / `DCI`

### Virtual Input

| Type   | DLC | Byte 0 | Byte 1 | Byte 2 | Byte 3 | Byte 4 | Byte 5 | Byte 6 | Byte 7|
|:------:|:---:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:-----:|
|Get     | 2   | 15     | NUM    |        |        |        |        |        |       |
|Set     | 7   | 15     | NOT    | NUM    | VR0    | VR1    | VR2    | MDC    |       |
|Response| 7   | 143    | NOT    | NUM    | VR0    | VR1    | VR2    | MDC    |       |

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
        - 0 = `Momentary`
        - 1 = `Latching`

### Wiper

| Type   | DLC | Byte 0 | Byte 1 | Byte 2 | Byte 3 | Byte 4 | Byte 5 | Byte 6 | Byte 7|
|:------:|:---:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:-----:|
|Get     | 1   | 20     |        |        |        |        |        |        |       |
|Set     | 8   | 20     | CLM    | SIN    | FIN    | IIN    | OIN    | PIN    | WIN   |
|Response| 8   | 148    | CLM    | SIN    | FIN    | IIN    | OIN    | PIN    | WIN   |

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

### Wiper Speed

| Type   | DLC | Byte 0 | Byte 1 | Byte 2 | Byte 3 | Byte 4 | Byte 5 | Byte 6 | Byte 7|
|:------:|:---:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:-----:|
|Get     | 1   | 21     |        |        |        |        |        |        |       |
|Set     | 7   | 21     | SWI    | SPI    | S01    | S23    | S45    | S67    |       |
|Response| 7   | 149    | SWI    | SPI    | S01    | S23    | S45    | S67    |       |

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
|Get     | 1   | 22     |        |        |        |        |        |        |       |
|Set     | 7   | 22     | IT0    | IT1    | IT2    | IT3    | IT4    | IT5    |       |
|Response| 7   | 150    | IT0    | IT1    | IT2    | IT3    | IT4    | IT5    |       |

- `ITn` - Wiper intermittent time (ms / 100)

### Flasher

| Type   | DLC | Byte 0 | Byte 1 | Byte 2 | Byte 3 | Byte 4 | Byte 5 | Byte 6 | Byte 7|
|:------:|:---:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:-----:|
|Get     | 2   | 25     | NUM    |        |        |        |        |        |       |
|Set     | 6   | 25     | NUM    | IN     |        | ON     | OFF    |        |       |
|Response| 6   | 153    | NUM    | IN     |        | ON     | OFF    |        |       |

- `NUM`
    - Bit 0 = Flasher enable/disable
        - 0 = `Disable`
        - 1 = `Enable`
    - Bit 1 = Single/continous flash
    - Bit 4-7 = Flasher number
- `IN` - Flasher input (see [Variable Map](variablemap.md))
- `ON` - Flash on time (ms / 10)
- `OFF` - Flash off time (ms / 10)
- 
### Starter Disable

| Type   | DLC | Byte 0 | Byte 1 | Byte 2 | Byte 3 | Byte 4 | Byte 5 | Byte 6 | Byte 7|
|:------:|:---:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:-----:|
|Get     | 1   | 30     |        |        |        |        |        |        |       |
|Set     | 4   | 30     | EN     | IN     | OUT    |        |        |        |       |
|Response| 4   | 158    | EN     | IN     | OUT    |        |        |        |       |

- `EN`
    - Bit 0 = Starter disable enable/disable
        - 0 = `Disable`
        - 1 = `Enable`
- `IN` - Starter disable input (see [Variable Map](variablemap.md))
- `OUT` - Starter disable outputs
    - Bit 0 = Output 1
    - Bit n = Output n+1
    - Bit 7 = Output 8

### CAN Input

| Type   | DLC | Byte 0 | Byte 1 | Byte 2 | Byte 3 | Byte 4 | Byte 5 | Byte 6 | Byte 7|
|:------:|:---:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:-----:|
|Get     | 2   | 35     | NUM    |        |        |        |        |        |       |
|Set     | 7   | 35     | NUM    | OME    | POS    | ARG    | ARG    | TIM    |       |
|Response| 7   | 163    | NUM    | OME    | POS    | ARG    | ARG    | TIM    |       |

- `NUM` - Input number
- `OME`
    - Bit 0 = Input enable/disable
        - 0 = `Disable`
        - 1 = `Enable`
    - Bit 1 to Bit 2 = Mode
        - 0 = `Momentary`
        - 1 = `Latching`
    - Bit 3 = Timeout enable/disable
        - 0 = `Disable`
        - 1 = `Enable`
    - Bit 4 to 7 = Operator
        - 0 = `Equal`
        - 1 = `Not Equal`
        - 2 = `Greater Than`
        - 3 = `Less Than`
        - 4 = `Greater Than or Equal`
        - 5 = `Less Than or Equal`
        - 6 = `Bitwise And`
        - 7 = `Bitwise Nand`
- `POS` - Value Position
    - Bit 0 to 3 = Starting Byte
    - Bit 4 to 7 = Number of bytes (1 or 2)
- `ARG` - Argument (2 bytes)
- `TIM` - Timeout Time (ms / 100)

### CAN Input ID

|   Type   |  DLC  | Byte 0 | Byte 1 | Byte 2 | Byte 3 | Byte 4 | Byte 5 | Byte 6 | Byte 7 |
| :------: | :---: | :----: | :----: | :----: | :----: | :----: | :----: | :----: | :----: |
|   Get    |   2   |   36   |  NUM   |        |        |        |        |        |        |
|   Set    |   8   |   36   |  NUM   |  SID   |  SID   |  EID   |  EID   |  EID   |  EID   |
| Response |   8   |  164   |  NUM   |  SID   |  SID   |  EID   |  EID   |  EID   |  EID   |

- `NUM` - Input number
- `SID` - Standard CAN ID
    - 11 bit
    - 3 bits of Byte 2 (0x07)
- `EID` - Extended CAN ID
    - 29 bit
    - 6 bits of Byte 4 (0x1F)

### Counter

|   Type   |  DLC  | Byte 0 | Byte 1 | Byte 2 | Byte 3 | Byte 4 | Byte 5 | Byte 6 | Byte 7 |
| :------: | :---: | :----: | :----: | :----: | :----: | :----: | :----: | :----: | :----: |
|   Get    |   2   |   40   |  NUM   |        |        |        |        |        |        |
|   Set    |   8   |   40   |  NUM   |  ENA   |  ICI   |  DCI   |  RSI   |  CNT   |  EDG   |
| Response |   8   |  168   |  NUM   |  ENA   |  ICI   |  DCI   |  RSI   |  CNT   |  EDG   |

- `NUM` - Counter number
- `ENA` - Counter enable/disable
    - Bit 0
      - 0 = `Disable`
      - 1 = `Enable`
    - Bit 1 = Value Wraparound
- `ICI` - Increment input (see [Variable Map](variablemap.md))
- `DCI` - Decrement input (see [Variable Map](variablemap.md))
- `RSI` - Reset input (see [Variable Map](variablemap.md))
- `CNT` - Count min/max
    - Bits 0 to 3 = Minimum value
    - Bits 4 to 7 = Maximum value
- `EDG` - Edge type
    - Bits 0 to 1 = Increment edge type
    - Bits 2 to 3 = Decrement edge type
    - Bits 4 to 5 = Reset edge type
      - 0 = `Rising`
      - 1 = `Falling`
      - 2 = `Both`
    
### Condition

|   Type   |  DLC  | Byte 0 | Byte 1 | Byte 2 | Byte 3 | Byte 4 | Byte 5 | Byte 6 | Byte 7 |
| :------: | :---: | :----: | :----: | :----: | :----: | :----: | :----: | :----: | :----: |
|   Get    |   2   |   45   |  NUM   |        |        |        |        |        |        |
|   Set    |   6   |   45   |  NUM   |  OPE   |  IN    |  ARG   |  ARG   |        |        |
| Response |   6   |  173   |  NUM   |  OPE   |  IN    |  ARG   |  ARG   |        |        |

- `NUM` - Condition number
- `OPE`
    - Bit 0 = Condition enable/disable
      - 0 = `Disable`
      - 1 = `Enable`
    - Bits 4 to 7 = Operator
      - 0 = `Equal`
      - 1 = `Not Equal`
      - 2 = `Greater Than`
      - 3 = `Less Than`
      - 4 = `Greater Than or Equal`
      - 5 = `Less Than or Equal`
      - 6 = `Bitwise And`
      - 7 = `Bitwise Nand`
- `IN` - Condition input (see [Variable Map](variablemap.md))
- `ARG` - Argument
  
### Keypad

|   Type   |  DLC  | Byte 0 | Byte 1 | Byte 2 | Byte 3 | Byte 4 | Byte 5 | Byte 6 | Byte 7 |
| :------: | :---: | :----: | :----: | :----: | :----: | :----: | :----: | :----: | :----: |
|   Get    |   2   |   50   |  NUM   |        |        |        |        |        |        |
|   Set    |   6   |   50   |  NUM   |  ENA   |  NID   |  TIM   | MOD    |        |        |
| Response |   6   |  178   |  NUM   |  ENA   |  NID   |  TIM   | MOD    |        |        |

- `NUM` - Keypad number
- `ENA`
    - Bit 0 = Keypad enable/disable
        - 0 = `Disable`
        - 1 = `Enable`
- `NID` 
    - Bits 0 to 6 = Keypad CANopen Node ID
        - 1 to 127
    - Bit 7 = Timeout enable
        - 0 = `Disable`
        - 1 = `Enable`
- `TIM` - Timeout Time (ms / 100)
- `MOD` - Keypad model
    - 0 = `BLINK_2_KEY` 
    - 1 = `BLINK_4_KEY`
    - 2 = `BLINK_5_KEY`
    - 3 = `BLINK_6_KEY`
    - 4 = `BLINK_8_KEY`
    - 5 = `BLINK_10_KEY`
    - 6 = `BLINK_12_KEY`
    - 7 = `BLINK_15_KEY`
    - 8 = `BLINK_13_KEY_2_DIAL`
    - 9 = `BLINK_RACEPAD`
    - 10 = `GRAYHILL_6_KEY`
    - 11 = `GRAYHILL_8_KEY`
    - 12 = `GRAYHILL_15_KEY`
    - 13 = `GRAYHILL_20_KEY`

### Keypad LEDs

|   Type   |  DLC  | Byte 0 | Byte 1 | Byte 2 | Byte 3 | Byte 4 | Byte 5 | Byte 6 | Byte 7 |
| :------: | :---: | :----: | :----: | :----: | :----: | :----: | :----: | :----: | :----: |
|   Get    |   2   |   51   |  NUM   |        |        |        |        |        |        |
|   Set    |   8   |   51   |  NUM   |  BLB   |  BLC   |  DLB   |  DIM   |  BTB   |  DBB   |
| Response |   8   |  179   |  NUM   |  BLB   |  BLC   |  DLB   |  DIM   |  BTB   |  DBB   |

- `NUM` - Keypad number
- `BLB` - Backlight brightness - 0 (min) to 255 (100%)
- `BLC` - Backlight color
    - 0 = `Off`
    - 1 = `Red`
    - 2 = `Green`
    - 3 = `Blue`
    - 4 = `Yellow`
    - 5 = `Cyan`
    - 6 = `Violet`
    - 7 = `White`
    - 8 = `Amber`
    - 9 = `Yellow Green`
- `DLB` - Dim backlight brightness - 0 (min) to 255 (100%)
- `DIM` - Dimming input (see [Variable Map](variablemap.md))
- `BTB` - Button brightness (all buttons) - 0 (min) to 255 (100%)
- `DBB` - Dim button brightness - 0 (min) to 255 (100%)

### Keypad Buttons

|   Type   |  DLC  | Byte 0 | Byte 1 | Byte 2 | Byte 3 | Byte 4 | Byte 5 | Byte 6 | Byte 7 |
| :------: | :---: | :----: | :----: | :----: | :----: | :----: | :----: | :----: | :----: |
|   Get    |   2   |   52   |  NUM   |        |        |        |        |        |        |
|   Set    |   8   |   52   |  NUM   |  ENA   |  VV0   |  VV1   |  VV2   |  VV3   |  FVV   |
| Response |   8   |  180   |  NUM   |  ENA   |  VV0   |  VV1   |  VV2   |  VV3   |  FVV   |

- `NUM`
    - Bits 0 to 2 = Keypad number
    - Bits 3 to 7 = Button number
- `ENA`
    - Bit 0 = Button enabled
        - 0 = `Disable`
        - 1 = `Enable`
    - Bit 2 = Mode
        - 0 = `Momentary`
        - 1 = `Latching`
    - Bit 3 to Bit 6 = Val Flashing
        - 0 = `Solid`
        - 1 = `Flashing`
    - Bit 7 = Fault Flashing
        - 0 = `Solid`
        - 1 = `Flashing`
- `VV0` to `VV3` - Val var 0 to 3 (see [Variable Map](variablemap.md))
- `FVV` - Fault val var (see [Variable Map](variablemap.md))

### Keypad Button LEDs

|   Type   |  DLC  | Byte 0 | Byte 1 | Byte 2 | Byte 3 | Byte 4 | Byte 5 | Byte 6 | Byte 7 |
| :------: | :---: | :----: | :----: | :----: | :----: | :----: | :----: | :----: | :----: |
|   Get    |   2   |   53   |  NUM   |        |        |        |        |        |        |
|   Set    |   8   |   53   |  NUM   |  C01   |  C23   |  FVC   |  B01   |  B23   |  FBC   |
| Response |   8   |  181   |  NUM   |  C01   |  C23   |  FVC   |  B01   |  B23   |  FBC   |

- `NUM`
    - Bits 0 to 2 = Keypad number
    - Bits 3 to 7 = Button number
- `C01`
    - Bits 0 to 4 = Value 0 color
    - Bits 5 to 7 = Value 1 color
        - 0 = `Off`
        - 1 = `Red`
        - 2 = `Green`
        - 3 = `Orange`
        - 4 = `Blue`
        - 5 = `Violet`
        - 6 = `Cyan`
        - 7 = `White`
- `C23`
    - Bits 0 to 4 = Value 2 color
    - Bits 5 to 7 = Value 3 color
- `FVC`
    - Bits 0 to 4 = Fault value color
    - Bits 5 to 7 = Num of color values (2 to 4)
- `B01`
    - Bits 0 to 4 = Blinking value 0 color
    - Bits 5 to 7 = Blinking value 1 color
- `B23`
    - Bits 0 to 4 = Blinking value 2 color
    - Bits 5 to 7 = Blinking value 3 color
- `FBC`
    - Bits 0 to 4 = Blinking fault value color

### Keypad Dials

|   Type   |  DLC  | Byte 0 | Byte 1 | Byte 2 | Byte 3 | Byte 4 | Byte 5 | Byte 6 | Byte 7 |
| :------: | :---: | :----: | :----: | :----: | :----: | :----: | :----: | :----: | :----: |
|   Get    |   2   |   54   |  NUM   |        |        |        |        |        |        |
|   Set    |   5   |   54   |  NUM   |  DMI   |  DMA   |  DOF   |        |        |        |
| Response |   5   |  182   |  NUM   |  DMI   |  DMA   |  DOF   |        |        |        |

- `NUM`
    - Bits 0 to 2 = Keypad number
    - Bits 3 to 7 = Dial number
- `DMI` = Dial min LED
- `DMA` = Dial max LED
- `DOF` = Dial LED offset

## Special

There are some special messages that are used for special functions. 

### Version

This message gets the firmware version

| Type   | DLC | Byte 0 | Byte 1 | Byte 2 | Byte 3 | Byte 4 | Byte 5 | Byte 6 | Byte 7|
|:------:|:---:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:-----:|
|Get     | 1   | 120    |        |        |        |        |        |        |       |
|Response| 5   | 248    | MA     |  MI    |  BH    |  BL    |        |        |       |

- `MA` - Major
- `MI` - Minor
- `BH` - Build High Byte
- `BL` - Build Low Byte
- 
### Sleep

The sleep message triggers the PDM to immediately go to sleep. 

| Type   | DLC | Byte 0 | Byte 1 | Byte 2 | Byte 3 | Byte 4 | Byte 5 | Byte 6 | Byte 7|
|:------:|:---:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:-----:|
|Get     | 4   | 121    | U      | I      | T      |        |        |        |       |
|Response| 2   | 249    | OK     |        |        |        |        |        |       |

!!! Note
    This message will not have an effect if the sleep conditions are not met, see Sleep

### Bootloader

This message jumps to the bootloader for firmware updating
| Type   | DLC | Byte 0 | Byte 1 | Byte 2 | Byte 3 | Byte 4 | Byte 5 | Byte 6 | Byte 7|
|:------:|:---:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:-----:|
|Get     | 4   | 125    |        |        |        |        |        |        |       |
|Response| 2   | 253    | OK     |        |        |        |        |        |       |

### Burn

The burn message triggers the PDM to save the configuration to FRAM memory. 

Without this message, any settings change will be lost on a power cycle

A response will be sent with the result of the Burn

| Type   | DLC | Byte 0 | Byte 1 | Byte 2 | Byte 3 | Byte 4 | Byte 5 | Byte 6 | Byte 7|
|:------:|:---:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:-----:|
|Get     | 4   | 127    | 1      | 3      | 8      |        |        |        |       |
|Response| 2   | 255    | OK     |        |        |        |        |        |       |

!!! Tip
    This is an easy way to test new settings. Try new settings without Burn and then cycle power to restore the old settings

### Wake Up

This message triggers the PDM to wake up from sleep.

There is no response to this message.

!!! Tip
    The format of this message is not critical, any CAN message will wake the PDM

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

`N1` will contain the [error number](./errors.md#error-numbers). 

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
| 9      | Battery Voltage   | Volts (V*10)|                |             | Battery voltage under/over      |
| 10     | CAN               |             |                |             | CAN warning or error            |
| 11     | USB               |             |                |             | USB warning or error            |
| 12     | Over Temperature  | Temp (C*10) |                |             | Board temp warning or error     |
| 13     | Configuration     |             |                |             | Device config init error        |
| 14     | FRAM              |             |                |             | FRAM init error                 |
| 15     | ADC               |             |                |             | ADC DMA init error              |
| 16     | I2C               |             |                |             | I2C init error                  |
| 17     | Temperature Sensor|             |                |             | Temperature sensor init error   |
| 18     | USB Connected     |             |                |             | USB cable connection detected   |
| 19     | Init              |             |                |             | Error during initialization     |