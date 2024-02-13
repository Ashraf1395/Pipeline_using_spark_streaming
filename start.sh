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


# Function to run command in a new VSCode terminal
run_command_in_new_terminal() {
    code --goto "$1" &
    sleep 5  # Wait for VSCode window to open
    code --remote-command "$2"
}

# Run producer in a new VSCode terminal
run_command_in_new_terminal "producer.py" "python3 ./pyspark_streaming/producer.py"

# Run consumer with default settings in a new VSCode terminal
run_command_in_new_terminal "consumer.py" "python3 ./pyspark_streaming/consumer.py"

# Run streaming.py in a new VSCode terminal
run_command_in_new_terminal "spark-submit.sh" "./pyspark_streaming/spark-submit.sh ./pyspark_streaming/streaming.py"