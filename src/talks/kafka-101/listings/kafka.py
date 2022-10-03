from kafka import KafkaProducer
from kafka import KafkaConsumer

# Producer
producer = KafkaProducer(bootstrap_servers="localhost:9092")

for count in range(100):
    producer.send("bus-location", count)

# Consumer
consumer = KafkaConsumer("bus-location")

for msg in consumer:
    print(msg)
