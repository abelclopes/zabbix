# 03 - Configuracao no frontend

Os tres proxies devem existir em **Administration > Proxies** com nomes
identicos aos `Hostname` dos arquivos de configuracao:

| Proxy | Modo | Conexao aceita pelo Server |
|---|---|---|
| proxy-onprem-snmp-ipmi | ativo | sem criptografia |
| proxy-cloud-web-01 | ativo | PSK, identidade `proxy-cloud-web-01` |
| proxy-cloud-web-02 | ativo | PSK, identidade `proxy-cloud-web-02` |

Associe ao grupo `ONPREM - SNMP e IPMI` apenas hosts e templates SNMP/IPMI e
selecione `proxy-onprem-snmp-ipmi` em **Monitored by proxy**. Nao associe itens
Agent, HTTP, JMX ou VMware a esse proxy.

Nos grupos `CLOUD WEB 01` e `CLOUD WEB 02`, associe apenas hosts com HTTP Agent
e cenarios Web aos proxies cloud correspondentes. Nao crie interfaces ou itens
IPMI nesses grupos.

Os PSKs em `secrets/` devem ser inseridos no cadastro dos proxies por canal
seguro e nunca versionados.

## Hosts de demonstracao configurados

| Host | Grupo | Monitorado por | Coleta |
|---|---|---|---|
| LAB - Dispositivo SNMP On-Prem | ONPREM - SNMP e IPMI | proxy-onprem-snmp-ipmi | SNMPv2c uptime |
| LAB - Aplicacao Web Cloud 01 | CLOUD WEB 01 | proxy-cloud-web-01 | cenario Web HTTP 200 |
| LAB - Aplicacao Web Cloud 02 | CLOUD WEB 02 | proxy-cloud-web-02 | cenario Web HTTP 200 |

O host SNMP possui somente interface e item SNMP. Os hosts cloud possuem apenas
os cenarios Web de demonstracao e nao possuem interface ou item IPMI.
