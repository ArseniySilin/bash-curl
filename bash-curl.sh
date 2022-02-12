#!/bin/bash

status_code=$(curl --write-out %{http_code} --silent --output /dev/null 'https://www.ru' -H 'Connection: keep-alive' -H 'Content-Type: application/json; charset=UTF-8' -H 'Accept: application/json, text/plain, */*' -H 'Sec-Fetch-Site: same-site' -H 'Sec-Fetch-Mode: cors')

if [[ "$status_code" -ne 200 ]] ; then
  echo "Error, code=$status_code"
else
  echo "Success, code=$status_code"
  # sound notification
  tput bel && sleep 0.33s && tput bel && sleep 0.33s && tput bel && sleep 0.033s
  exit 0
fi
