#!/bin/sh

PATH=/usr/bin
export PATH

URL_FILE="</path/to>/urls.txt"
DT_ENDPOINT="<Tenant URL with environment ID>/api/v2/metrics/ingest"
DT_TOKEN="<API Token with Ingest.Metrics Permission>"
PAYLOAD="</path/to>/dt_payload.$$"
HOST_IP="<Host IP>"
check(){
url="$1"
status=$(curl -s -o /dev/null -w "%{http_code}" "$url")
echo "custom.url.status,host=$HOST_IP,url=\"$url\" $status" >> "$PAYLOAD"
}
while IFS= read -r url
 do 
   check "$url" &
 done < "$URL_FILE"

wait
curl -X POST -H "Authorization: API-Token $DT_TOKEN" -H "Content-Type:text/plain" --data-binary @"$PAYLOAD" "$DT_ENDPOINT"
rm -f "$PAYLOAD"
