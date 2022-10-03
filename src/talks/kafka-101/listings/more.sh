#!/usr/bin/env bash

kafka-topics --create --topic bus-fuel --partitions 2

kafka-consumer --topic bus-fuel --group traffic # twice
