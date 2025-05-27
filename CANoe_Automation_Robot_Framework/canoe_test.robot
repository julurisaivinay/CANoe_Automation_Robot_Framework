*** Settings ***
Library   C:/Users/srava/Desktop/Vinay_AET/CANoe_Automation_Robot_Framework/canoe_keywords.py


*** Test Cases ***
Run Diagnostic Test
    Open Diag And Start Measurement    C:/Users/srava/Desktop/Vinay_AET/CANoe_Automation_Robot_Framework/resources/RBS/RBS_Python_v0.2/RBS_Python.cfg
    Send Diag Requests
Test ACC Active
    Set CAN Signal       CAN     1    MO_Message_1         MO_sig_ReadytoDrive     2
    Set CAN Signal       CAN     1    ACC_BCM_Message      ACC_Int_status          1
    Set CAN Signal       CAN     1    ACC_BCM_Message      ACC_MainSwitch_ACC      2
    Set CAN Signal       CAN     1    Gear_Message         Gear_signal             3
    Set CAN Signal       CAN     1    RDS_Coder_Data_CAN   Sig_Spdmtr_Rq           78
    Set CAN Signal       CAN     1    ACC_BCM_Message      ACC_Set_signal          1
    Verify CAN Signal    CAN     1    ACC_status           ACC_sig_status          2
Test ACC Passsive
    Set CAN Signal       CAN    1    MO_Message_1          MO_sig_ReadytoDrive     2
    Set CAN Signal       CAN    1    ACC_BCM_Message       ACC_Int_status          1
    Set CAN Signal       CAN    1    ACC_BCM_Message      ACC_MainSwitch_ACC       1
    Set CAN Signal       CAN    1    Gear_Message         Gear_signal              3
    Set CAN Signal       CAN    1    RDS_Coder_Data_CAN   Sig_Spdmtr_Rq            78
    Set CAN Signal       CAN    1    ACC_BCM_Message      ACC_Set_signal           1
    Verify CAN Signal    CAN    1    ACC_status           ACC_sig_status           1
Test ACC Passive and disp signal status
    Set CAN Signal       CAN    1    MO_Message_1         MO_sig_ReadytoDrive      2
    Set CAN Signal       CAN    1    ACC_BCM_Message      ACC_Int_status           1
    Set CAN Signal       CAN    1    ACC_BCM_Message      ACC_MainSwitch_ACC       2
    Set CAN Signal       CAN    1    Gear_Message         Gear_signal              3
    Set CAN Signal       CAN    1    RDS_Coder_Data_CAN   Sig_Spdmtr_Rq            35
    set can signal       CAN    1    ACC_BCM_Message      ACC_Set_signal           1
    Verify CAN Signal    CAN    1     ACC_status          ACC_sig_status           1
    Get Display status   CAN    1     ACC_status          ACC_disp_signal          2
Test ACC Passive and ACC disp with APC Conditions
    Set CAN Signal       CAN    1    MO_Message_1         MO_sig_ReadytoDrive      2
    Set CAN Signal       CAN    1    ACC_BCM_Message      ACC_Int_status           1
    Set CAN Signal       CAN    1    ACC_BCM_Message      ACC_MainSwitch_ACC       2
    Set CAN Signal       CAN    1    Gear_Message         Gear_signal              1
    Set CAN Signal       CAN    1    RDS_Coder_Data_CAN   Sig_Spdmtr_Rq            50
    set can signal       CAN    1    ACC_BCM_Message      ACC_Set_signal           1
    Verify CAN Signal    CAN    1     ACC_status          ACC_sig_status           1
    Get Display status   CAN    1     ACC_status          ACC_disp_signal          3

Test ACC Active Status then trigger SOC Condition and check ACC Passive status and disp signal status
    Set CAN Signal       CAN    1    MO_Message_1         MO_sig_ReadytoDrive      2
    Set CAN Signal       CAN    1    ACC_BCM_Message      ACC_Int_status           1
    Set CAN Signal       CAN    1    ACC_BCM_Message      ACC_MainSwitch_ACC       2
    Set CAN Signal       CAN    1    Gear_Message         Gear_signal              3
    Set CAN Signal       CAN    1    RDS_Coder_Data_CAN   Sig_Spdmtr_Rq            50
    set can signal       CAN    1    ACC_BCM_Message      ACC_Set_signal           2
    Verify CAN Signal    CAN    1    ACC_status           ACC_sig_status           1
    Set CAN Signal       CAN    1    RDS_Coder_Data_CAN   Sig_Spdmtr_Rq            35
    set can signal       CAN    1    ACC_BCM_Message      ACC_Set_signal           1
    Verify CAN Signal    CAN    1    ACC_status           ACC_sig_status           1
    Get Display status   CAN    1    ACC_status           ACC_disp_signal          2

Test ACC Active Status then trigger SOC Condition and check ACC Activecls status and disp signal status
    Set CAN Signal       CAN    1    MO_Message_1         MO_sig_ReadytoDrive      2
    Set CAN Signal       CAN    1    ACC_BCM_Message      ACC_Int_status           1
    Set CAN Signal       CAN    1    ACC_BCM_Message      ACC_MainSwitch_ACC       2
    Set CAN Signal       CAN    1    Gear_Message         Gear_signal              3
    Set CAN Signal       CAN    1    RDS_Coder_Data_CAN   Sig_Spdmtr_Rq            50
    set can signal       CAN    1    ACC_BCM_Message      ACC_Set_signal           1
    Verify CAN Signal    CAN    1    ACC_status           ACC_sig_status           2
    Set CAN Signal       CAN    1    Gear_Message         Gear_signal              1
    set can signal       CAN    1    ACC_BCM_Message      ACC_Set_signal           1
    Verify CAN Signal    CAN    1    ACC_status           ACC_sig_status           1
    Get Display status   CAN    1    ACC_status           ACC_disp_signal          3

Test Stop Measurement
    Stop Measurement