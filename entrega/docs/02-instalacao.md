# 02 - Instalacao

## Pre-requisitos

- Docker Engine e Docker Compose v2;
- rede Docker externa `monitoring-network`;
- portas TCP 8083 (frontend), 10150 (agent) e 10151 (server) livres;
- arquivo `.env` local com as credenciais MySQL.

## Procedimento

```bash
docker network create monitoring-network  # somente se ainda nao existir
cp .env.example .env
# edite .env e use senhas fortes
./scripts/start.sh
./scripts/test-connectivity.sh
```

O Compose cria tres volumes Docker independentes para os bancos SQLite dos
proxies. O banco do Server permanece em `mysql-zabbix50/`.

O frontend e publicado localmente em `http://localhost:8083/`.

O Compose tambem inicia os alvos de demonstracao, acessiveis apenas na rede
Docker: `snmp-device-onprem:1161/udp`, `web-app-cloud-01:80` e
`web-app-cloud-02:80`.
