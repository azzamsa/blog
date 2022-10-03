#!/usr/bin/env bash

# Compose
docker-compose up -d
docker-compose logs kowl
docker-compose restart kowl

# Kafka bins
docker exec -it kafkatalk_kafka1_1 /bin/bash
cd /usr/bin/ # kafka-topics.sh location

# Kafka commands

## List topics
kafka-topics --list

## Create topics
kafka-topics.sh --bootstrap-server localhost:9092 --create --topic bus-location

kafka-topics --create --topic bus-location- --replication-factor 1 --partitions 2

## Describe topics
kafka-topics.sh --bootstrap-server localhost:9092 --describe --topic bus-location

## Produce message
kafka-console-producer.sh --bootstrap-server localhost:9092 --topic bus-location

## Consume message
kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic bus-location --from-beginning 

## Consumer group
kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic bus-location --group traffic
