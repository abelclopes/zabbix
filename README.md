# Laboratorio Zabbix 5.0 com tres proxies ativos

Ambiente com um proxy on-premises dedicado a SNMP/IPMI e dois proxies cloud
simulados dedicados a HTTP/Web com TLS PSK.

## Inicio rapido

1. Copie `.env.example` para `.env` e defina senhas fortes.
2. Garanta que a rede `monitoring-network` exista.
3. Execute `scripts/start.sh`.
4. Acesse `http://localhost:8083/`.

Os PSKs ficam em `secrets/`, fora do Git. O material original esta preservado em
`material-original/`. Consulte `docs/` para arquitetura, instalacao e testes.
