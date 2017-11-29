# Workflow for RaspberryPi Device

1.  Execute ```sudo chmod +x start.sh```
2.  Execute the file using ```./start.sh```
3.  This file does the following:
    1.  Checks if pip is installed in python
    2.  Checks if <b>paho mqtt</b> library is installed for python
    3.  Downloads root CA Certificate if not present
    4.  Captures the Unique Serial Number for RaspberryPi device
    5.  Runs AWS IoT application on device
