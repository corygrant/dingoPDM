
## `V` - Power

The Power LED, `V` on the case, indicates that the 3.3V power is on. 

!!! Tip
    To reduce power consumption, this LED can be disabled by cutting a jumper on the PCB.

    To restore the LED, the jumper can be bridged with solder. 

## `S` - Status

The Status LED, 'S' on the case, is used to indicate the status of the device. 

## `E` - Error

The Error LED, 'E' on the case, is used to indicate an error on the device. 

See [Error State](./errors.md) for more information. 

## States

- :black_large_square: : LED Off
- :green_square: or :red_square: : LED On
- :green_square: :fontawesome-solid-burst: or :red_square: :fontawesome-solid-burst: : LED Blinking
- :red_square: :fontawesome-solid-burst::octicons-number-24: : LED Blinking Code

| V                    | S                                        | E                                                          |  Description                                 |
|----------------------|------------------------------------------|------------------------------------------------------------|----------------------------------------------|
| :black_large_square: | :black_large_square:                     | :black_large_square:                                       | Power off or power not ok. Check power input |
| :green_square:       | :black_large_square:                     | :black_large_square:                                       | Device sleep                                 |
| :green_square:       | :green_square:                           | :black_large_square:                                       | Device operating properly                    |
| :green_square:       | :green_square: :fontawesome-solid-burst: | :black_large_square:                                       | Output overcurrent detected                  |
| :green_square:       | :green_square: :fontawesome-solid-burst: | :red_square:                                               | Output overcurrent count limit reached       |
| :green_square:       | :green_square: :fontawesome-solid-burst: | :red_square:  :fontawesome-solid-burst:                    | Device overtemp reached, all outputs off     |
| :green_square:       | :black_large_square:                     | :red_square: :fontawesome-solid-burst::octicons-number-24: | Blink error number, see [Error State](./errors.md) |