import paho.mqtt.client as mqtt

def on_connect(client, userdata, flags, reason_code, properties):
    if reason_code == 0:
        print("Connection successful")
    else:
        print("Connection failed")


if __name__ == '__main__':
    mqttc = mqtt.Client(mqtt.CallbackAPIVersion.VERSION2, client_id="PythonSubscriber")
    mqttc.on_connect = on_connect

    mqttc.connect("177.21.85.228", 1883, 60)

    mqttc.loop_forever()