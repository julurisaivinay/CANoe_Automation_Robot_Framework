### CANoe Automation with Robot Framework
Aim of the Project:
This project automates Vector CANoe diagnostic and signal testing using the Robot Framework and Python.

### Project Structure
├── canoe_test.robot # Main test suite
├── canoe_keywords.py # Custom keywords for CANoe & diagnostics
├── README.md # Project documentation
└── resources/
└── RBS_Python.cfg # CANoe configuration file


### Prerequisites
- Python 3.8+
- Robot Framework
- pywin32
- py_canoe module (custom CANoe interface)
- Vector CANoe installed (e.g., CANoe 11.0)


### To Run the Test cases
open Terminal
Run robot filename.robot (Eg., robot canoe_test.robot)


### To Check the log and Report (Same Directory where testcases and resource files are available)
Output:  C:\Users\srava\Desktop\Vinay_AET\robot\robot\output.xml
Log:     C:\Users\srava\Desktop\Vinay_AET\robot\robot\log.html
Report:  C:\Users\srava\Desktop\Vinay_AET\robot\robot\report.html



