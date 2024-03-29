# Connections

## Connectors

![Connections](../images/ConnectionsWhite.svg#only-dark)
![Connections](../images/ConnectionsBlack.svg#only-light)

|ID| Connector           | Details         | Qty |
| -| ------------------- | --------------  | --- |
| 1| DT 12 Pos Connector | `DT06-12SA`     | 1   |
|  | DT 12 Wedgelock     | `W12S`          | 1   |
|  | 14-16AWG Socket     | `0462-209-16141`| 2   |
|  | 16-20AWG Socket     | `0462-201-16141`| 10  |
| 2| 12V DC Power Lug    | `M6` or `1/4"`  | 1   |
| 3| Ground Lug          | `M6` or `1/4"`  | 1   |
| 4| USB Type C          |                 | 1   |

## Pinout

![DT 12](../images/DTPinNumsWhite.svg#only-dark)
![DT 12](../images/DTPinNumsBlack.svg#only-light)

| Pin | Function| Current |
| --- | ------- | ------- |
| 1   | CAN L   |         |
| 2   | CAN H   |         |
| 3   | Output 8| 8A      |
| 4   | Output 7| 8A      |
| 5   | Output 6| 8A      |
| 6   | Output 5| 8A      |
| 7   | Output 1| 14A     |
| 8   | Input 1 |         |
| 9   | Output 4| 8A      |
| 10  | Output 3| 8A      |
| 11  | Input 2 |         |
| 12  | Output 2| 14A     |

!!! note
    No internal terminating resistor on CAN connection, must be added externally

## Test Points

![Test Points](../images/TestPointsWhite.svg#only-dark)
![Test Points](../images/TestPointsBlack.svg#only-light)

| Label     | Function     | MCU Pin |
| ---       | ------------ | ------- |
| I2C       | I2C1 Clock   | `PB6`   |
| I2D       | I2C1 Data    | `PB7`   |
| CR        | CAN Receive  | `PB8`   |
| CT        | CAN Transmit | `PB9`   |
| E1        | Extra 1      | `PC10`  |
| E2        | Extra 2      | `PC11`  |
| E3        | Extra 3      | `PC13`  |
| GND       | Ground       | `Ground`|
| TagConnect| Debugger     |         |