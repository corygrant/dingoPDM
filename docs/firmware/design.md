# Design

# Device State
``` mermaid
stateDiagram
    [*] --> DEVICE_POWER_ON
    DEVICE_POWER_ON --> DEVICE_STARTING
    DEVICE_STARTING --> DEVICE_RUN : Init Complete
    DEVICE_RUN --> DEVICE_OVERTEMP : Temp > Max
    DEVICE_OVERTEMP --> DEVICE_RUN : Temp < Max
    DEVICE_POWER_ON --> DEVICE_ERROR : Error
    DEVICE_STARTING --> DEVICE_ERROR : Error
    DEVICE_RUN --> DEVICE_ERROR : Error
    DEVICE_OVERTEMP --> DEVICE_ERROR : Error
    DEVICE_ERROR --> [*]
```