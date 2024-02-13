
# Pipeline_using_spark_streaming

## Project Overview

The "Pipeline_using_spark_streaming" project aims to demonstrate stream processing using Apache Spark Streaming in Python. It includes Docker configurations for setting up Kafka and Spark services, along with example scripts for producing and consuming data streams.

## Project Description

The project showcases the implementation of stream processing workflows using Apache Spark Streaming. It covers the following key aspects:

### Docker Setup

The Docker module includes Dockerfiles and docker-compose definitions to run Kafka and Spark in Docker containers. This facilitates the deployment of required services, ensuring easy setup and configuration for stream processing.

### Producer-Consumer Example

Example scripts for producing and consuming data streams are included. These scripts illustrate how to generate data streams (producer) and process them in real-time (consumer) using Apache Spark Streaming.

### Start Script

A `start.sh` script automates the setup process. It installs dependencies, creates Docker networks and volumes, builds Spark images, and starts Docker Compose for Spark and Kafka services.

## Architecture

The architecture of the project involves the following components:

### Docker Containers

Kafka and Spark services are deployed within Docker containers. Kafka serves as the message broker for streaming data, while Spark provides the stream processing capabilities.

### Producer

The producer script generates data streams, which are then sent to Kafka topics. These data streams may represent various types of real-time events or data sources.

### Consumer

The consumer script subscribes to Kafka topics and consumes the data streams. It processes the incoming data in real-time using Apache Spark Streaming, performing tasks such as data aggregation, filtering, or transformation.

### Spark Streaming

Apache Spark Streaming provides the core stream processing engine. It ingests data from Kafka topics, processes it in micro-batches, and produces the final results or output streams.

### Integration

Docker orchestration and containerization enable seamless integration and deployment of Kafka and Spark services. This ensures scalability, flexibility, and ease of management for stream processing workflows.

## Usage

To run the producer-consumer examples, execute the following commands:

```bash
# Start producer script
python3 ./pyspark_streamng/producer.py

# Start consumer script
python3 ./pyspark_streaming/consumer.py
```

Alternatively, you can run all scripts using the provided `start.sh` file:

```bash
#!/bin/bash


pip install -r requirements.txt

# Create Docker Network and Volume
docker network create kafka-spark-network
docker volume create --name hadoop-distributed-file-system

#Build image
chmod +x ./docker/spark/build.sh

./docker/spark/build.sh

# Start Docker Compose for Spark and Kafka in detached mode
docker-compose -f ./docker/spark/docker-compose.yml up -d


# # Function to run command in a new VSCode terminal
# run_command_in_new_terminal() {
#     code --goto "$1" &
#     sleep 5  # Wait for VSCode window to open
#     code --remote-command "$2"
# }

# # Run producer in a new VSCode terminal
# run_command_in_new_terminal "producer.py" "python3 ./pyspark_streaming/producer.py"

# # Run consumer with default settings in a new VSCode terminal
# run_command_in_new_terminal "consumer.py" "python3 ./pyspark_streaming/consumer.py"

# # Run streaming.py in a new VSCode terminal
# run_command_in_new_terminal "spark-submit.sh" "./pyspark_streaming/spark-submit.sh ./pyspark_streaming/streaming.py"
```
