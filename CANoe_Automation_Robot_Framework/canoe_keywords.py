from py_canoe import CANoe
import time
from robot.api.deco import keyword
import win32com.client

canoe = None  # Global CANoe instance
CANoe_app = win32com.client.DispatchEx("CANoe.Application")


@keyword("Open Diag And Start Measurement")
def open_diag_and_start_measurement(config_path):
    global canoe
    canoe = CANoe()
    canoe.open(config_path)
    canoe.start_measurement()
    time.sleep(3)
    print("CANoe opened and measurement started.")


@keyword("Send Diag Requests")
def send_diag_requests():
    global canoe
    ##if not canoe:
    ## raise RuntimeError("CANoe instance not initialized. Run 'Open Diag And Start Measurement' first.")

    print("Sending diagnostic requests...")
    default_session = canoe.send_diag_request(diag_ecu_qualifier_name="Door", request="10 01")
    time.sleep(1)

    extended_session = canoe.send_diag_request(diag_ecu_qualifier_name="Door", request="10 03")
    time.sleep(2)

    variant_code = canoe.send_diag_request(diag_ecu_qualifier_name="Door", request="2E DE 02 01 02")
    time.sleep(2)

    print("Responses received:")
    print("Default Session:", default_session)
    print("Extended Session:", extended_session)
    print("Variant Coding:", variant_code)


"""
@keyword("ACC Active")
def ACC_Active():
    CANoe_app= win32com.client.DispatchEx("CANoe.Application")
    M0_drive_sig = CANoe_app.GetBus("CAN").GetSignal(1, "MO_Message_1", "MO_sig_ReadytoDrive")
    time.sleep(0.1)
    M0_drive_sig.Value = 0x2
    time.sleep(0.5)
    ACC_Init_Status = CANoe_app.GetBus("CAN").GetSignal(1, "ACC_BCM_Message", "ACC_Int_status")
    time.sleep(0.1)
    ACC_Init_Status.Value = 0x1
    time.sleep(0.5)
    ACC_MainSwitch_ACC = CANoe_app.GetBus("CAN").GetSignal(1, "ACC_BCM_Message", "ACC_MainSwitch_ACC")
    time.sleep(0.1)
    ACC_MainSwitch_ACC.Value = 0x2
    time.sleep(0.5)
    Gear_Signal = CANoe_app.GetBus("CAN").GetSignal(1, "Gear_Message", "Gear_signal")
    time.sleep(0.1)
    Gear_Signal.Value = 0x3
    time.sleep(0.5)
    Sig_Spdmtr_Rq = CANoe_app.GetBus("CAN").GetSignal(1, "RDS_Coder_Data_CAN", "Sig_Spdmtr_Rq")
    time.sleep(0.1)
    Sig_Spdmtr_Rq.Value = 78
    time.sleep(0.5)
    ACC_Set_signal = CANoe_app.GetBus("CAN").GetSignal(1, "ACC_BCM_Message", "ACC_Set_signal")
    time.sleep(0.1)
    ACC_Set_signal.Value = 0x1
    time.sleep(0.5)

    ACC_Status = CANoe_app.GetBus("CAN").GetSignal(1, "ACC_status", "ACC_sig_status")
    #ACC_sig_status = CANoe_app.GetBus("CAN").GetSignal(1, "ACC_Status", "ACC_sig_status")
    if int(ACC_Status) == 0x2:
        print("The test case 1 is Passed")
    else:
        print("The test case 1 is Failed")

"""


@keyword("Set CAN Signal")
def set_can_signal(bus_name, channel, message_name, signal_name, value):
    bus = CANoe_app.GetBus(bus_name)
    signal = bus.GetSignal(int(channel), message_name, signal_name)
    signal.Value = int(value)
    time.sleep(0.1)
    print(f"set {bus_name}: {message_name}.{signal_name} to {value} ")


@keyword("Verify CAN Signal")
def verify_can_signal(bus_name, channel, message_name, signal_name, expected_value):
    # canoe_app = win32com.client.DispatchEx("CANoe.Application")
    signal = CANoe_app.GetBus(bus_name).GetSignal(int(channel), message_name, signal_name)
    actual_value = int(signal.Value)
    print(f"Verifying {message_name}.{signal_name}: Actual = {actual_value}, Expected = {expected_value}")

    if actual_value == int(expected_value, 0):  # handles decimal or hex input like "0x2"
        print("PASS: Signal value matches expected.")
    else:
        raise AssertionError(f"FAIL: Expected {expected_value}, but got {actual_value}")


@keyword("Get Display status")
def get_display_status(bus_name, channel, message_name, signal_name, expected_value):
    signal = CANoe_app.GetBus(bus_name).GetSignal(int(channel), message_name, signal_name)
    actual_value = int(signal.Value)
    print(f"Actual = {actual_value}, Expected = {expected_value}")

    if actual_value == int(expected_value) == 2:
        print("Vehicle speed is too low")
    elif actual_value == int(expected_value) == 3:
        print("Please check the Gear Position")
    else:
        print("Reserved")


@keyword("Stop Measurement")
def stop_measurement():
    canoe.stop_measurement()
    print("Tests are Performed and measurement stopped")
