
import cantools
import dingopdm_max

def build_db(base_id):
    db = cantools.database.Database()
    db.name = "dingoPdm-Max"
    db.version = "0.4.12"
    
    db.messages.append(dingopdm_max.build_msg_0(base_id))
    db.messages.append(dingopdm_max.build_msg_1(base_id))
    
    db.messages.append(dingopdm_max.build_msg_3(base_id))
    db.messages.append(dingopdm_max.build_msg_4(base_id))
    db.messages.append(dingopdm_max.build_msg_5(base_id))
    db.messages.append(dingopdm_max.build_msg_6(base_id))
    db.messages.append(dingopdm_max.build_msg_7(base_id))
    db.messages.append(dingopdm_max.build_msg_8(base_id))
    db.messages.append(dingopdm_max.build_msg_9(base_id))
    db.messages.append(dingopdm_max.build_msg_10(base_id))
    db.messages.append(dingopdm_max.build_msg_11(base_id))
    db.messages.append(dingopdm_max.build_msg_12(base_id))
    db.messages.append(dingopdm_max.build_msg_13(base_id))
    db.messages.append(dingopdm_max.build_msg_14(base_id))
    db.messages.append(dingopdm_max.build_msg_15(base_id))

    return db