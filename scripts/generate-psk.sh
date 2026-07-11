#!/usr/bin/env bash
set -euo pipefail
root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
for proxy in proxy-cloud-web-01 proxy-cloud-web-02; do
  file="$root/secrets/$proxy.psk"
  if [[ ! -s "$file" ]]; then
    openssl rand -hex 32 > "$file"
    echo "PSK gerada: $file"
  else
    echo "PSK preservada: $file"
  fi
  # O processo zabbix no container precisa ler o bind mount somente leitura.
  chmod 644 "$file"
done
