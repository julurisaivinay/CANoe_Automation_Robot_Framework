#  CANoe Automation with Robot Framework

## Aim of the Project

This project automates **Vector CANoe** diagnostic and signal testing using the **Robot Framework** and **Python**. Through reusable, scriptable test cases, engineers can validate communication, diagnostics, and signal integrity within automotive systems.

---

```
## 📁 Project Structure

├── canoe_test.robot # Main test suite																																																																																																																							
├── canoe_keywords.py # Custom keywords for CANoe & diagnostics
├── README.md # Project documentation
└── resources/
└── RBS_Python.cfg # CANoe configuration file

```

---

## Prerequisites

Ensure the following software and libraries are installed on your system:

- [Python 3.8+](https://www.python.org/downloads/)
- [Robot Framework](https://robotframework.org/)
- [`pywin32`](https://pypi.org/project/pywin32/) (for Windows COM interface support)
- `py_canoe` (a custom Python module to interface with Vector CANoe via COM)
- [Vector CANoe](https://www.vector.com/int/en/products/products-a-z/software/canoe/) (e.g., version 11.0)

> Note: `py_canoe` is not publicly available and is assumed to be developed or provided in-house for CANoe communication.

---

## Install Python dependencies:
pip install -r requirements.txt
or
pip install robotframework pywin32

## Running Test Cases
1. Open Terminal (or Command Prompt) and navigate to the project directory.
  ```bash
3. robot canoe_test.robot
```

## Log and Report Files
After test execution, Robot Framework generates the following files in the same directory:
I. output.xml – raw output file
II. log.html – detailed execution log
III. report.html – summary report

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/your-repo.git
   cd your-repo


