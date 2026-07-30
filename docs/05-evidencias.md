# 05 - Evidencias

Data da validacao: 11/07/2026.

| Componente | Evidencia |
|---|---|
| MySQL | container `healthy` |
| Zabbix Server | processo ativo em TCP 10051 |
| Frontend | `http://localhost:8083/` retornando HTTP 200 |
| Agent | `agent.ping=1` |
| proxy-onprem-snmp-ipmi | ativo, configuracao recebida, sem TLS |
| proxy-cloud-web-01 | ativo, configuracao recebida por TLS PSK |
| proxy-cloud-web-02 | ativo, configuracao recebida por TLS PSK |

Os registros no banco apresentaram `lastaccess` recente para os tres proxies.
As identidades PSK possuem 18 caracteres e as chaves 64 hexadecimais, sem que
os valores secretos sejam incluidos nesta evidencia.

## Coletas funcionais

- `LAB - Dispositivo SNMP On-Prem`: uptime coletado via SNMPv2c pelo proxy
  on-premises;
- `LAB - Aplicacao Web Cloud 01`: resposta HTTP 200 coletada pelo cloud 01;
- `LAB - Aplicacao Web Cloud 02`: resposta HTTP 200 coletada pelo cloud 02.

Cada host esta no grupo dedicado e associado ao respectivo proxy.
