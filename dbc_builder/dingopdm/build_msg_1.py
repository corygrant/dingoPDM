import cantools
from utils.signal_utils import create_duplicate_signals

def build_msg_1(base_id):
    message = cantools.database.Message(
        frame_id=base_id + 1,
        name="dingoPdmMsg1",
        length=8,
        is_extended_frame=False,
        signals=[]
    )

    output_current_sigs = create_duplicate_signals("OutputCurrent", 4, 1, 0, 16, 0.1, 0, "A")
    message.signals.extend(output_current_sigs)
    return message