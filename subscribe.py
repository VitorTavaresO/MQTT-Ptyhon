from time import sleep
import paho.mqtt.publish as publish
import paho.mqtt.subscribe as subscribe

HOSTNAME = "177.21.85.228"

def subscribe_to_topic(topic):
    msg = subscribe.simple(topic, hostname=HOSTNAME, qos=2)
    return msg

if __name__ == '__main__':
    while True:
        msg = subscribe_to_topic("topic/test")
        if msg:
            print(f"Topic: {msg.topic}")
            print(f"Payload: {msg.payload.decode('utf-8')}")
            print(f"QoS: {msg.qos}")
            print(f"Retain: {msg.retain}")
        else:
            print("No message received")