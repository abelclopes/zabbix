#!/usr/bin/env bash
set -euo pipefail
root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
"$root/scripts/generate-psk.sh"
docker network inspect monitoring-network >/dev/null 2>&1 || \
  docker network create monitoring-network >/dev/null
docker compose -f "$root/docker-compose-zabbix50.yaml" up -d --remove-orphans
