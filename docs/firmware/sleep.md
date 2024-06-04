Sleep state will be be entered when these conditions are met:

- No USB connected
- No CAN traffic for 30 seconds
- No outputs on for 30 seconds

Sleep state can be exited by one of these Wake inputs:

- Any CAN traffic
- Digital Input changing state

!!!Tip
    To further reduce power consumption, the power LED can be disabled by cutting the solder bridge near the LED

!!!Note "v7.2 Hardware"
    v7.2 hardware does not have the power LED solder bridge or CAN disable pin connected.

    To further reduce consumption, the LED or resistor must be de-soldered. 

    A jumper wire can be added between E3 test pad and the CAN transceiver pin 8 (Rs)


Test results

- :green_square: : Enabled
- :red_square: : Disabled
- :yellow_square: : Requires modification

| State            | LED            | CAN Transceiver | Current (@12V) | v7.2 HW         |
| ---------------- | -------------- | --------------  | -------------- | --------------- |
| Run (no outputs) | :green_square: | :green_square:  | 40-50mA        | :green_square:  |
| Run (no outputs) | :red_square:   | :green_square:  | 35-45mA        | :yellow_square: |
| Sleep            | :green_square: | :green_square:  | 17mA           | :green_square:  |
| Sleep            | :red_square:   | :green_square:  | 13mA           | :yellow_square: |
| Sleep            | :green_square: | :red_square:    | 8mA            | :yellow_square: |
| Sleep            | :red_square:   | :red_square:    | 6mA            | :yellow_square: |
