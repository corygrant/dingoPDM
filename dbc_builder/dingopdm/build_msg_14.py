import cantools
from utils.signal_utils import create_duplicate_signals

def build_msg_14(base_id):
    message = cantools.database.Message(
        frame_id=base_id + 14,
        name="dingoPdmMsg14",
        length=8,
        is_extended_frame=False,
        signals=[]
    )

    can_in_val_sigs = create_duplicate_signals("CANInputValue", 4, 29, 0, 16, 1, 0)
    message.signals.extend(can_in_val_sigs)
    return message