#!/bin/sh
set -e
: "${KOMARI_TOKEN:?need KOMARI_TOKEN}"
: "${KOMARI_ENDPOINT:=https://panel.muse08.de5.net}"
mkdir -p /www && echo ok > /www/index.html
python3 -m http.server "${PORT:-3000}" --directory /www >/dev/null 2>&1 &
exec /komari-agent --endpoint "$KOMARI_ENDPOINT" --token "$KOMARI_TOKEN" --get-ip-addr-from-nic --disable-auto-update
