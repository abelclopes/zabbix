#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
compose=(docker compose -f "$root/docker-compose-zabbix50.yaml")

echo "Alvos do laboratorio:"
"${compose[@]}" ps --format '{{.Service}}: {{.Status}}' \
  snmp-device-onprem web-app-cloud-01 web-app-cloud-02

echo
echo "Dados mais recentes no Zabbix:"
docker exec zabbix-mysql-zabbix-1 sh -c 'MYSQL_PWD="$MYSQL_PASSWORD" mysql \
  -u"$MYSQL_USER" "$MYSQL_DATABASE" -N -e "
SELECT CONCAT(\"SNMP uptime: \",value,\" centesimos de segundo - \",FROM_UNIXTIME(clock))
FROM history_uint WHERE itemid=(SELECT itemid FROM items WHERE key_=\"snmp.uptime\" LIMIT 1)
ORDER BY clock DESC LIMIT 1;
SELECT CONCAT(h.name,\": HTTP \",hu.value,\" - \",FROM_UNIXTIME(hu.clock))
FROM hosts h JOIN items i ON i.hostid=h.hostid JOIN history_uint hu ON hu.itemid=i.itemid
WHERE h.host LIKE \"lab-web-cloud-%\" AND i.key_ LIKE \"web.test.rspcode[%\"
AND hu.clock=(SELECT MAX(h2.clock) FROM history_uint h2 WHERE h2.itemid=i.itemid)
ORDER BY h.host;"'
