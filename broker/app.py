import paho.mqtt.client as mqtt

HOSTNAME = "177.21.85.228"
TOPICS = {
    "humidity": "sensor/humidity",
    "temperature": "sensor/temperature",
    "incidence": "sensor/incidence",
    "all": "sensors"
}

def on_connect(client, userdata, flags, rc):
    for topic in TOPICS.values():
        client.subscribe(topic)

def on_message(client, userdata, msg):
    print(f"Message received on {msg.topic}: {msg.payload.decode()}")

client = mqtt.Client()
client.on_connect = on_connect
client.on_message = on_message

client.connect(HOSTNAME, 1883, 60)
client.loop_start()

def menu():
    print("1. Solicitar Dados de Umidade")
    print("2. Solicitar Dados de Temperatura")
    print("3. Solicitar Dados de Incidência Solar")
    print("4. Solicitar Todos os Dados")
    print("5. Sair")

while True:
    menu()
    choice = input("Escolha uma opção: ")
    if choice == '1':
        client.publish(TOPICS["humidity"], "Requesting humidity data")
    elif choice == '2':
        client.publish(TOPICS["temperature"], "Requesting temperature data")
    elif choice == '3':
        client.publish(TOPICS["incidence"], "Requesting incidence data")
    elif choice == '4':
        client.publish(TOPICS["all"], "Requesting all data")
    elif choice == '5':
        break
    else:
        print("Opção inválida. Tente novamente.")