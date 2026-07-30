# 04 - Testes

Execute:

```bash
./scripts/validate-config.sh
./scripts/test-connectivity.sh
./scripts/test-lab.sh
docker compose -f docker-compose-zabbix50.yaml ps
```

Validacoes esperadas:

- todos os proxies apresentam estado `healthy`;
- logs contêm `received configuration data from server`;
- on-prem: `ProxyMode=0`, `StartIPMIPollers=3`, `StartHTTPPollers=0` e
  `TLSConnect=unencrypted`;
- cloud: `ProxyMode=0`, `StartIPMIPollers=0`, `StartHTTPPollers=3` e
  `TLSConnect=psk`;
- cada proxy possui `lastaccess` recente no frontend;
- o frontend local em `http://localhost:8083/` retorna HTTP 200;
- o item `SNMP uptime do dispositivo` possui valor recente;
- os dois cenarios Web possuem codigo de resposta HTTP 200.

`SNMP monitoring: YES`, `IPMI monitoring: YES` e `Web monitoring: YES` no banner
indicam recursos compilados no binario. A ativacao operacional e determinada
pelos processos `Start*` e pelos tipos de itens associados no frontend.
