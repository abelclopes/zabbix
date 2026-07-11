#!/usr/bin/env bash
set -euo pipefail
root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
docker compose -f "$root/docker-compose-zabbix50.yaml" logs -f --tail=100 "${@:-}"
