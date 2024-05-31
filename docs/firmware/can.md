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

![OutputChart](../images/canoutputTableWhite.svg#only-dark){ .off-glb }
![OutputChart](../images/canoutputTableBlack.svg#only-light){ .off-glb }

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
    - `BV` - Battery Voltage (V * 10)
    - `BT` - Board Temperature (deg C * 10)
- *Base ID + 1*
    - `OC1` to `OC4` - Output n Current (Amps * 10)
- *Base ID + 2*
    - `OC5` to `OC8` - Output n Current (Amps * 10)
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

`C` *CAN* --> `c`

![CANChart](../images/canSettingsMsgsWhite.svg#only-dark){ .off-glb }
![CANChart](../images/canSettingsMsgsBlack.svg#only-light){ .off-glb }

- `SPE`
    - Bit 0 = CAN enable/disable
    - Bit 1 = CAN transmit enable/disable
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

`N` *CAN Input* --> `n`

![CANInputChart](../images/canInputMsgsWhite.svg#only-dark){ .off-glb }
![CANInputChart](../images/canInputMsgsBlack.svg#only-light){ .off-glb }

- `OME`
    - Bit 0 = Input enable/disable
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

`I` *Input* --> `i`

`O` *Output* --> `o`

`U` *Virtual Input* --> `u`

`H` *Flasher* --> `h`

`W` *Wiper* --> `w`

`P` *Wiper Speed* --> `p`

`Y` *Wiper Delay* --> `y`

`D` *Starter Disable* --> `d`


## Special

There are some special messages that are used for special functions. 

!!! Danger
    Insert message chart here

`B` *Burn* --> `b`

The burn message triggers the PDM to save the configuration to FRAM memory. 

Without this message, any settings change will be lost on a power cycle

A response will be sent with the result of the Burn

![BurnChart](../images/burnMsgsWhite.svg#only-dark){ .off-glb }
![BurnChart](../images/burnMsgsBlack.svg#only-light){ .off-glb }

!!! Tip
    This is an easy way to test new settings. Try new settings without Burn and then cycle power to restore the old settings

`Q` *Sleep* --> `q`

The sleep message triggers the PDM to immediately go to sleep. 

![SleepChart](../images/sleepMsgsWhite.svg#only-dark){ .off-glb }
![SleepChart](../images/sleepMsgsBlack.svg#only-light){ .off-glb }

!!! Note
    This message will not have an effect if the sleep conditions are not met, see Sleep

`!` *Wake Up*

This message triggers the PDM to wake up from sleep.

There is no response to this message.

!!! Tip
    The format of this message is not critical, any CAN message will wake the PDM

`V` *Version* --> `v`

This message gets the firmware version

![VersionChart](../images/versionMsgsWhite.svg#only-dark){ .off-glb }
![VersionChart](../images/versionMsgsBlack.svg#only-light){ .off-glb }

- `MA` - Major
- `MI` - Minor
- `BH` - Build High Byte
- `BL` - Build Low Byte