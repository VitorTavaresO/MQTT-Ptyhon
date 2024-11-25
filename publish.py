from time import sleep
import paho.mqtt.publish as publish
import paho.mqtt.subscribe as subscribe

HOSTNAME = "177.21.85.228"

def publish_single_message(topic, message, qos):
    publish.single(topic, message, hostname=HOSTNAME, qos=qos)

def publish_multiple_messages(messages):
    publish.multiple(messages, hostname=HOSTNAME)

if __name__ == '__main__':

    publish_single_message("topic/test", "Hello World", 2)

    msgs = [{'topic':"topic/test", 'payload':"Teste 1"},
    ("topic/test", "Test 2", 2, False)]
    publish_multiple_messages(msgs)
