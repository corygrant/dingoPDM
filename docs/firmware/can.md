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
    - **Mode Num**
        - Note: Always momentary
        - *Equal*:
            - Result = Byte value(s) == Mask
        - *GreaterThan*:
            - Result = Byte value(s) > Mask
        - *LessThan*
            - Result = Byte value(s) < Mask
        - *BitwiseAnd*
            - Result = Byte value(s) & Mask
        - *BitwiseNand*
            - Result = !(Byte value(s) & Mask)
    - **Mode Latching or Momentary**
        - *BitwiseAnd*
            - Result = Byte value(s) & Mask
        - *BitwiseNand*
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

!!! Danger
    Insert message chart here

## Settings

To change configuration settings on the PDM, settings messages must be sent over CAN (or USB). 

These settings messages have an uppercase letter prefix that is sent in the first byte of the message. 

They must also be sent with a special CAN message ID, Base ID - 1

!!! Warning
    Only messages with the ID = Base ID - 1 will be evaluated for settings changes

For every valid settings message, a response message will be sent back. 

The response message will have a lowercase letter prefix. 

!!! Danger
    Insert message chart here

`C` *CAN* --> `c`

`N` *CAN Input* --> `n`

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

!!! Tip
    This is an easy way to test new settings. Try new settings without Burn and then cycle power to restore the old settings

`Q` *Sleep*

The sleep message triggers the PDM to immediately go to sleep. 

There is no response to this message (that would wake the PDM)

!!! Note
    This message will not have an effect if the sleep conditions are not met, see Sleep

`!` *Wake Up*

This message triggers the PDM to wake up from sleep.

There is no response to this message.

!!! Tip
    The format of this message is not critical, any CAN message will wake the PDM