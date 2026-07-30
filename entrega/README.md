# Entrega - Zabbix 5.0 com tres proxies ativos

Pacote da atividade de Gerenciamento e Monitoramento de Aplicacoes e
Infraestrutura.

## Arquitetura entregue

| Proxy | Modo | Funcao | Comunicacao com o Server |
|---|---|---|---|
| `proxy-onprem-snmp-ipmi` | ativo | SNMP/IPMI | sem criptografia |
| `proxy-cloud-web-01` | ativo | HTTP/Web | TLS PSK |
| `proxy-cloud-web-02` | ativo | HTTP/Web | TLS PSK |

Os proxies cloud sao simulados na rede local, representando duas regioes ou
provedores. Cada proxy possui configuracao e banco SQLite persistente separado.

## Conteudo

- `docker-compose-zabbix50.yaml`: ambiente completo;
- `configs/`: configuracoes individuais dos tres proxies;
- `envs/`: variaveis do Server, frontend e Agent;
- `lab/`: dispositivo SNMP e duas aplicacoes Web de demonstracao;
- `scripts/`: inicializacao e validacoes;
- `docs/`: planejamento, instalacao, configuracao e testes;
- `prints/`: evidencias numeradas da atividade;
- `secrets/`: apenas instrucoes; nenhum PSK real foi incluido.

## Execucao

```bash
cp .env.example .env
# Edite .env e substitua todas as senhas de exemplo.
./scripts/start.sh
```

O script gera dois PSKs locais, cria a rede `monitoring-network` quando
necessario e inicia o Compose. Acesse o frontend em:

```text
http://localhost:8083/
```

Login inicial do Zabbix 5.0: usuario `Admin` e senha padrao `zabbix`. Troque a
senha apos o primeiro acesso.

Cadastre os tres proxies, grupos, hosts SNMP/Web e cenarios conforme
`docs/03-configuracao-frontend.md`. Em uma instalacao nova, esses objetos do
frontend precisam ser criados depois que o banco inicializar.

## Validacao

```bash
./scripts/validate-config.sh
./scripts/test-connectivity.sh
./scripts/test-lab.sh
```

## Seguranca

O pacote nao contem `.env`, valores PSK, banco de dados ou volumes. Nunca envie
os arquivos gerados em `secrets/*.psk` nem credenciais reais.
