import paho.mqtt.subscribe as subscribe

HOSTNAME = "177.21.85.228"

def subscribe_to_topic(topic):
    msgs = subscribe.simple(topic, hostname=HOSTNAME, msg_count=3, qos=2)
    return msgs

if __name__ == '__main__':
    msgs = subscribe_to_topic("topic/test")
    for msg in msgs:
        print(f"Topic: {msg.topic}")
        print(f"Payload: {msg.payload.decode('utf-8')}")
        print(f"QoS: {msg.qos}")
        print(f"Retain: {msg.retain}")