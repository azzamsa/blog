#!/usr/bin/env bash

# kafka-topics is alias to kafka-topics.sh --bootstrap-server localhost:9092

kafka-topics --list
kafka-topics --create --topic bus-location # --replication-factor 1 --partitions 2
kafka-topics --describe --topic bus-location
