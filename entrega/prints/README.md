# Prints das evidencias

As evidencias principais estao numeradas na ordem sugerida para apresentacao.

| Ordem | Arquivo | Comprovacao |
|---:|---|---|
| 1 | `01-containers-healthy.png` | Containers e tres proxies saudaveis |
| 2 | `02-proxies-ativos-criptografia.png` | Modo ativo, PSK nos cloud e NONE no on-prem |
| 3 | `03-config-proxy-onprem.png` | IPMI habilitado, Web desabilitada e conexao sem TLS |
| 4 | `04-config-proxy-cloud-01.png` | Web habilitada, IPMI desabilitado e TLS PSK no cloud 01 |
| 5 | `05-config-proxy-cloud-02.png` | Web habilitada, IPMI desabilitado e TLS PSK no cloud 02 |
| 6 | `06-comunicacao-proxies-confirmada.png` | Comunicacao dos tres proxies com o Server |
| 7 | `07-hosts-associados-aos-proxies.png` | Hosts de laboratorio associados aos proxies corretos |
| 8 | `08-coleta-snmp-onprem.png` | Uptime recebido por SNMP no proxy on-premises |
| 9 | `09-web-cloud-01-ok.png` | Cenario Web do cloud 01 com status OK |
| 10 | `10-web-cloud-02-ok.png` | Cenario Web do cloud 02 com status OK |
| 11 | `11-teste-laboratorio.png` | Alvos saudaveis, SNMP coletado e HTTP 200 nos cloud |

## Auxiliares

`auxiliares/` preserva capturas antigas, cortadas ou com alertas. Elas nao sao
necessarias para a entrega principal e nao foram apagadas.

Antes de enviar a atividade, confira novamente se nenhuma captura exibe senha,
valor PSK, token ou outra credencial.
