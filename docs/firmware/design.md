# Design

# Device State
``` mermaid
stateDiagram
    [*] --> PowerOn
    PowerOn --> Starting
    Starting --> Run : Init Complete
    Run --> OverTemp : Temp > Max
    OverTemp --> Run : Temp < Max
    Run --> Sleep : Timeout
    Sleep --> Wake : Activity
    Wake --> Run
    Run --> Error : Error
    OverTemp --> Error : Temp > Critical
    Error --> [*]
```
