To enable software configuration a Variable Map is maintained on the device.

Each variable of the variable map corresponds to the result of another item.

These are used to:

- Control the output on/off
- Create logic with the Virtual Inputs
- Control wipers
- Turn flashers on/off
- Engage the starter disable

!!! Warning
    The Variable Map is subject to change as new functions/features are added.

| Index |    Variable     |
| :---: | :-------------: |
|   0   |      None       |
|   1   |  Digital In 1   |
|   2   |  Digital In 2   |
|   3   |    CAN In 1     |
|   4   |    CAN In 2     |
|   5   |    CAN In 3     |
|   6   |    CAN In 4     |
|   7   |    CAN In 5     |
|   8   |    CAN In 6     |
|   9   |    CAN In 7     |
|  10   |    CAN In 8     |
|  11   |    CAN In 9     |
|  12   |    CAN In 10    |
|  13   |    CAN In 11    |
|  14   |    CAN In 12    |
|  15   |    CAN In 13    |
|  16   |    CAN In 14    |
|  17   |    CAN In 15    |
|  18   |    CAN In 16    |
|  19   |    CAN In 17    |
|  20   |    CAN In 18    |
|  21   |    CAN In 19    |
|  22   |    CAN In 20    |
|  23   |    CAN In 21    |
|  24   |    CAN In 22    |
|  25   |    CAN In 23    |
|  26   |    CAN In 24    |
|  27   |    CAN In 25    |
|  28   |    CAN In 26    |
|  29   |    CAN In 27    |
|  30   |    CAN In 28    |
|  31   |    CAN In 29    |
|  32   |    CAN In 30    |
|  33   |    CAN In 31    |
|  34   |    CAN In 32    |
|  35   |  CAN In Val 1   |
|  36   |  CAN In Val 2   |
|  37   |  CAN In Val 3   |
|  38   |  CAN In Val 4   |
|  39   |  CAN In Val 5   |
|  40   |  CAN In Val 6   |
|  41   |  CAN In Val 7   |
|  42   |  CAN In Val 8   |
|  43   |  CAN In Val 9   |
|  44   |  CAN In Val 10  |
|  45   |  CAN In Val 11  |
|  46   |  CAN In Val 12  |
|  47   |  CAN In Val 13  |
|  48   |  CAN In Val 14  |
|  49   |  CAN In Val 15  |
|  50   |  CAN In Val 16  |
|  51   |  CAN In Val 17  |
|  52   |  CAN In Val 18  |
|  53   |  CAN In Val 19  |
|  54   |  CAN In Val 20  |
|  55   |  CAN In Val 21  |
|  56   |  CAN In Val 22  |
|  57   |  CAN In Val 23  |
|  58   |  CAN In Val 24  |
|  59   |  CAN In Val 25  |
|  60   |  CAN In Val 26  |
|  61   |  CAN In Val 27  |
|  62   |  CAN In Val 28  |
|  63   |  CAN In Val 29  |
|  64   |  CAN In Val 30  |
|  65   |  CAN In Val 31  |
|  66   |  CAN In Val 32  |
|  67   |  Virtual In 1   |
|  68   |  Virtual In 2   |
|  69   |  Virtual In 3   |
|  70   |  Virtual In 4   |
|  71   |  Virtual In 5   |
|  72   |  Virtual In 6   |
|  73   |  Virtual In 7   |
|  74   |  Virtual In 8   |
|  75   |  Virtual In 9   |
|  76   |  Virtual In 10  |
|  77   |  Virtual In 11  |
|  78   |  Virtual In 12  |
|  79   |  Virtual In 13  |
|  80   |  Virtual In 14  |
|  81   |  Virtual In 15  |
|  82   |  Virtual In 16  |
|  83   |   Output 1 On   |
|  84   |   Output 1 OC   |
|  85   | Output 1 Fault  |
|  86   |   Output 2 On   |
|  87   |   Output 2 OC   |
|  88   | Output 2 Fault  |
|  89   |   Output 3 On   |
|  90   |   Output 3 OC   |
|  91   | Output 3 Fault  |
|  92   |   Output 4 On   |
|  93   |   Output 4 OC   |
|  94   | Output 4 Fault  |
|  95   |   Output 5 On   |
|  96   |   Output 5 OC   |
|  97   | Output 5 Fault  |
|  98   |   Output 6 On   |
|  99   |   Output 6 OC   |
|  100  | Output 6 Fault  |
|  101  |   Output 7 On   |
|  102  |   Output 7 OC   |
|  103  | Output 7 Fault  |
|  104  |   Output 8 On   |
|  105  |   Output 8 OC   |
|  106  | Output 8 Fault  |
|  107  |   Wiper Slow    |
|  108  |   Wiper Fast    |
|  109  |   Wiper Park    |
|  110  |   Wiper Inter   |
|  111  |   Wiper Wash    |
|  112  |   Wiper Swipe   |
|  113  |    Flasher 1    |
|  114  |    Flasher 2    |
|  115  |    Flasher 3    |
|  116  |    Flasher 4    |
|  117  |  Counter Val 1  |
|  118  |  Counter Val 2  |
|  119  |  Counter Val 3  |
|  120  |  Counter Val 4  |
|  121  |   Condition 1   |
|  122  |   Condition 2   |
|  123  |   Condition 3   |
|  124  |   Condition 4   |
|  125  |   Condition 5   |
|  126  |   Condition 6   |
|  127  |   Condition 7   |
|  128  |   Condition 8   |
|  129  |   Condition 9   |
|  130  |  Condition 10   |
|  131  |  Condition 11   |
|  132  |  Condition 12   |
|  133  |  Condition 13   |
|  134  |  Condition 14   |
|  135  |  Condition 15   |
|  136  |  Condition 16   |
|  137  |  Condition 17   |
|  138  |  Condition 18   |
|  139  |  Condition 19   |
|  140  |  Condition 20   |
|  141  |  Condition 21   |
|  142  |  Condition 22   |
|  143  |  Condition 23   |
|  144  |  Condition 24   |
|  145  |  Condition 25   |
|  146  |  Condition 26   |
|  147  |  Condition 27   |
|  148  |  Condition 28   |
|  149  |  Condition 29   |
|  150  |  Condition 30   |
|  151  |  Condition 31   |
|  152  |  Condition 32   |
|  153  | Keypad 1 Btn 1  |
|  154  | Keypad 1 Btn 2  |
|  155  | Keypad 1 Btn 3  |
|  156  | Keypad 1 Btn 4  |
|  157  | Keypad 1 Btn 5  |
|  158  | Keypad 1 Btn 6  |
|  159  | Keypad 1 Btn 7  |
|  160  | Keypad 1 Btn 8  |
|  161  | Keypad 1 Btn 9  |
|  162  | Keypad 1 Btn 10 |
|  163  | Keypad 1 Btn 11 |
|  164  | Keypad 1 Btn 12 |
|  165  | Keypad 1 Btn 13 |
|  166  | Keypad 1 Btn 14 |
|  167  | Keypad 1 Btn 15 |
|  168  | Keypad 1 Btn 16 |
|  169  | Keypad 1 Btn 17 |
|  170  | Keypad 1 Btn 18 |
|  171  | Keypad 1 Btn 19 |
|  172  | Keypad 1 Btn 20 |
|  173  | Keypad 2 Btn 1  |
|  174  | Keypad 2 Btn 2  |
|  175  | Keypad 2 Btn 3  |
|  176  | Keypad 2 Btn 4  |
|  177  | Keypad 2 Btn 5  |
|  178  | Keypad 2 Btn 6  |
|  179  | Keypad 2 Btn 7  |
|  180  | Keypad 2 Btn 8  |
|  181  | Keypad 2 Btn 9  |
|  182  | Keypad 2 Btn 10 |
|  183  | Keypad 2 Btn 11 |
|  184  | Keypad 2 Btn 12 |
|  185  | Keypad 2 Btn 13 |
|  186  | Keypad 2 Btn 14 |
|  187  | Keypad 2 Btn 15 |
|  188  | Keypad 2 Btn 16 |
|  189  | Keypad 2 Btn 17 |
|  190  | Keypad 2 Btn 18 |
|  191  | Keypad 2 Btn 19 |
|  192  | Keypad 2 Btn 20 |
|  193  |    Always On    |
