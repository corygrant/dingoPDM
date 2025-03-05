# Case

![Exploded1](../images/ExplodedView1White.svg#only-dark){ .off-glb }
![Exploded1](../images/ExplodedView1Black.svg#only-light){ .off-glb }

![Exploded2](../images/ExplodedView2White.svg#only-dark){ .off-glb }
![Exploded2](../images/ExplodedView2Black.svg#only-light){ .off-glb }

The mechanical design is centered around simple designs that can be created in a home shop. 

* 3D Printed Case
* Flat aluminum heatsink plate
* Flat aluminum baseplate
* The heatsink is designed to be 2 pieces. A heatsink plate and a baseplate
    * The heatsink plate provides clearance for the THT pins of the Deutsch connectors and the RedCube terminal while getting as close to the Profets as possible
    * !!! warning
        The heatsink plate should be covered on both sides with a thermal pad material to electricaly isolate the heatsink while still providing a thermal interface (Example: 3M 5583S)
    * The baseplate holds the case and also sandwiches the spacer plate to the PCB

## Exploded Assembly

|  ID| Description         | Details                     | Qty |
|   -| ------------------- | --------------------------- | --- |
|   1| Baseplate           | `Aluminum 6061`             | 1   |
|   2| Heatsink            | `Aluminum 6061`             | 1   |
|   3| Case                | `3D Print`                  | 1   |
| 4.1| PCB                 |                             | 1   |
| 5.1| Ring Lug            | `M6` or `1/4"`              | 1   |
| 5.2| Lug Washers         | `M6 Flat`                   | 2   |
| 5.3| Lug Screws          | `M6x1.0x14mm`               | 2   |
| 5.5| Case Washers        | `M6 Flat`                   | 4   |
| 5.6| Case Screws         | `M6x1.0x14mm`               | 4   |
| 5.7| PCB Washers         | `M3 Flat`                   | 4   |
| 5.8| PCB Screws          | `M3x0.5x12mm`               | 4   |
|   6| DT Connector        | `12 Pin`                    | 1   |
|10.1| Light Pipe          | `PLPC2-10MM`                | 3   |
|  13| Connector Screws    | `No. 6, 5/8" Thread Forming`| 2   |

## Stress Testing

Stress tests were conducted with a dummy load at 71A total.

The device was mounted horizontaly (worst case).

Ambient temperature in the mid 60s F

```vegalite 
{
    "schema-url": "assets/charts/dingopdm_stresstest.json"
}
```

## Models

Models of the baseplate, heatsink and case can be found here:

[**Case STEP Files**](https://github.com/corygrant/DingoPDM/tree/master/Export/V7.4/Case)

[**Complete STEP File**](https://github.com/corygrant/DingoPDM/tree/master/Export/V7.4) (DingoPDM_V7_4.step)