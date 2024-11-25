import paho.mqtt.client as mqtt

HOSTNAME = "177.21.85.228"
TOPIC = "sensor/incidence"
GENERAL_TOPIC = "sensors"
INCIDENCE = 300

def on_connect(client, userdata, flags, rc):
    client.subscribe(TOPIC)
    client.subscribe(GENERAL_TOPIC)

def on_message(client, userdata, msg):
    if msg.payload.decode() == "Requesting incidence data":
        client.publish(TOPIC, f"Incidence: {INCIDENCE} W/m²")
    elif msg.payload.decode() == "Requesting all data":
        client.publish(GENERAL_TOPIC, f"Incidence: {INCIDENCE} W/m²")

client = mqtt.Client()
client.on_connect = on_connect
client.on_message = on_message

client.connect(HOSTNAME, 1883, 60)
client.loop_forever()