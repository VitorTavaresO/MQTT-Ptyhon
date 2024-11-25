import paho.mqtt.publish as publish

HOSTNAME = "177.21.85.228"

def publish_single_message(topic, payload, qos=0, retain=False):
    publish.single(topic, payload, qos=qos, retain=retain, hostname=HOSTNAME)

def publish_multiple_messages(messages):
    publish.multiple(messages, hostname=HOSTNAME)

if __name__ == '__main__':

    publish_single_message("topic/test", "Teste 1", 0, False)


    msgs = [
        ("topic/test", "Teste 2", 1, False),
        ("topic/test", "Test 3", 2, False),
    ]
    publish_multiple_messages(msgs)