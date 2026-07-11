#!/usr/bin/env bash
set -euo pipefail
root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
compose=(docker compose -f "$root/docker-compose-zabbix50.yaml")
"${compose[@]}" ps
curl -fsS http://127.0.0.1:8083/ >/dev/null
docker exec zabbix-zabbix-server-1 zabbix_get -s zabbix-agent -k agent.ping
for service in proxy-onprem-snmp-ipmi proxy-cloud-web-01 proxy-cloud-web-02; do
  "${compose[@]}" logs --since=10m "$service" | grep 'received configuration data from server' >/dev/null
  echo "$service: comunicacao confirmada"
done
