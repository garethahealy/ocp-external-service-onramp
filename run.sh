#!/usr/bin/env bash

ETH1_IP=$(ip addr show eth0 | grep -Po 'inet \K[\d.]+')

LISTENING_PORT="${LISTENING_PORT:-9779}"
EXTERNAL_SERVICE_IP="${EXTERNAL_SERVICE_IP:-10.2.2.2}"
EXTERNAL_SERVICE_PORT="${EXTERNAL_SERVICE_PORT:-4001}"

echo "Configured to listen on: $ETH1_IP:$LISTENING_PORT and forward to: $EXTERNAL_SERVICE_IP:$EXTERNAL_SERVICE_PORT"

iptables -t nat -A PREROUTING -p tcp --dport ${LISTENING_PORT} -j DNAT --to-destination ${EXTERNAL_SERVICE_IP}:${EXTERNAL_SERVICE_PORT}
iptables -t nat -A POSTROUTING -p tcp -d ${EXTERNAL_SERVICE_IP} --dport ${EXTERNAL_SERVICE_PORT} -j SNAT --to-source ${ETH1_IP}

exec /pause-code/pause
