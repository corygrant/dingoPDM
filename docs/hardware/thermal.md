## Stress Testing

### Full Load Test
- Full load tests were conducted with a dummy load at 71A total.
- The device was mounted horizontaly (worst case).
- Ambient temperature in the mid 60s F
- Resistive load on all outputs
- Green = 100% duty cycle - all outputs
- Orange = 50% duty cycle at 400Hz - all outputs
- Yellow = Warning temperature limit (131 deg F)
    - Warning message sent
- Red = Critical temperature limit (176 deg F)
    - Device shutdown 

```vegalite 
{
    "schema-url": "assets/charts/dingopdm_stresstest.json"
}
```