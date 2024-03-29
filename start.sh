#!/bin/bash

RED='\033[0;31m'
NC='\033[0m' # No Color
GREEN='\033[0;32m'
BLUE='\033[0;34m'

docker-compose up -d

echo -e "${BLUE}☁️ Confluent Platform is starting up...${NC}"

# ---- Set up Debezium source connector ---
export CONNECT_HOST=connect-debezium
echo -e "\n--\n\n$(date) Waiting for Kafka Connect to start on ${GREEN}$CONNECT_HOST${NC}… ⏳"
grep -q "Kafka Connect started" <(docker-compose logs -f $CONNECT_HOST)
# Wait for the connect-debezium service to start
sleep 15
echo -e "\n--\n$(date) 👉 Creating Debezium connector"
. ./scripts/submit_debezium_config.sh

echo -e "\n--\n$(date) 👉 Validating the setup by displaying topics in Kafka cluster"
docker exec -i kafka /usr/bin/kafka-topics --bootstrap-server kafka:9092 --list
