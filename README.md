# AWS-IoT-Shadows

Repo Content:
1.  <b>LED_Controller</b> <i>(Hardware Side Code)</i>: 'Device' / 'Thing' which will keep listening and sending 'reported' state payload to AWS IoT shadow.
2.  <b>LED_Switch</b> <i>(App Side Code)</i>: 'Device' / 'Server' which will keep listening and changing the shadow state using 'desired' part of AWS IoT shadow.
3.  <b>REST-API/REST_get_shadow</b>: Fetch Latest Shadow update via REST protocol
4.  <b>REST-API/REST_update_shadow</b>: Update Shadow via REST protocol
5.  <b>REST-API/REST_delete_shadow</b>: Delete Shadow via REST protocol
6.  <b>README.md</b>: information regarding repo


Dependencies:
1.  <b>Paho MQTT Client</b>: Install it using ```pip install paho-mqtt python-etcd``` command 
