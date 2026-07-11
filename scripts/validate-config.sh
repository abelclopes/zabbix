#!/usr/bin/env bash
set -euo pipefail
root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
docker compose -f "$root/docker-compose-zabbix50.yaml" config --quiet
for file in "$root"/configs/*/proxy.env; do
  grep -q '^ZBX_PROXYMODE=0$' "$file"
  grep -q '^ZBX_HOSTNAME=' "$file"
done
test -s "$root/secrets/proxy-cloud-web-01.psk"
test -s "$root/secrets/proxy-cloud-web-02.psk"
echo "Configuracao valida"
