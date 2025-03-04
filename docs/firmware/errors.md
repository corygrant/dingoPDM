
## Error State

The device will enter an error state when a non-recoverable issue occurs.

A [message](./can.md#messages) will be sent over CAN and/or USB and the [Error LED](./leds.md#e---error) will flash the error number. 

!!! Warning
    The only way to reset from an error is to cycle power on the device. 

## Error Numbers

| Error #       | Description        |
|:-------------:|--------------------|
| 1             | Watchdog           |
| 2             | Message Queue      |
| 3             | Task               |
| 4             | Configuration      |
| 5             | FRAM               |
| 6             | ADC                |
| 7             | Temperature Sensor |
| 8             | USB                |
| 9             | CAN                |
| 10            | CRC                |
| 11            | I2C                |
| 12            | RCC                |
| 13            | Temperature        |
| 14            | PWM                |