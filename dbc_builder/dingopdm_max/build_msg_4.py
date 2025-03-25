import cantools
from utils.signal_utils import create_duplicate_signals

def build_msg_4(base_id):
    message = cantools.database.Message(
        frame_id=base_id + 4,
        name="dingoPdmMaxMsg4",
        length=8,
        is_extended_frame=False,
        signals=[]
    )

    output_reset_count_sigs = create_duplicate_signals("OutputResetCount", 4, 1, 0, 8, 1, 0)
    message.signals.extend(output_reset_count_sigs)
    
    return message