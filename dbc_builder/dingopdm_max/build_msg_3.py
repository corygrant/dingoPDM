import cantools
from utils.signal_utils import create_duplicate_signals

def build_msg_3(base_id):
    message = cantools.database.Message(
        frame_id=base_id + 3,
        name="dingoPdmMaxMsg3",
        length=8,
        is_extended_frame=False,
        signals=[]
    )

    output_states = {
        0: "Off",
        1: "On",
        2: "Overcurrent",
        3: "Fault"
    }
    output_state_sigs = create_duplicate_signals("OutputState", 4, 1, 0, 4, 1, 0)
    for sig in output_state_sigs:
        sig.choices = output_states
    message.signals.extend(output_state_sigs)
    
    wiper_slow_speed_sig = cantools.database.Signal(
        name="WiperSlowSpeed",
        start=32,
        length=1,
        byte_order="little_endian",
        is_signed=False,
        minimum=0,
        maximum=1
    )
    message.signals.append(wiper_slow_speed_sig)
    
    wiper_fast_speed_sig = cantools.database.Signal(
        name="WiperFastSpeed",
        start=33,
        length=1,
        byte_order="little_endian",
        is_signed=False,
        minimum=0,
        maximum=1
    )
    message.signals.append(wiper_fast_speed_sig)
    
    wiper_speed_states = {
        0: "Park",
        1: "Slow",
        2: "Fast",
        3: "Intermit Speed 1",
        4: "Intermit Speed 2",
        5: "Intermit Speed 3",
        6: "Intermit Speed 4",
        7: "Intermit Speed 5",
        8: "Intermit Speed 6"
    }
    wiper_speed_sig = cantools.database.Signal(
        name="WiperSpeed",
        start=40,
        length=4,
        byte_order="little_endian",
        is_signed=False,
        minimum=0,
        maximum=8
    )
    wiper_speed_sig.choices = wiper_speed_states
    message.signals.append(wiper_speed_sig)
    
    wiper_states = {
        0: "Park",
        1: "Parking",
        2: "Slow",
        3: "Fast",
        4: "Intermit Pause",
        5: "Intermit On",
        6: "Wash",
        7: "Swipe"
    }
    wiper_state_sig = cantools.database.Signal(
        name="WiperState",
        start=44,
        length=4,
        byte_order="little_endian",
        is_signed=False,
        minimum=0,
        maximum=7
    )
    wiper_state_sig.choices = wiper_states
    message.signals.append(wiper_state_sig)
    
    flasher_sigs = create_duplicate_signals("Flasher", 4, 1, 48, 1, 1, 0)
    message.signals.extend(flasher_sigs)
    
    return message