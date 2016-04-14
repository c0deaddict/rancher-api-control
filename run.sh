#!/bin/sh

echo "Sleeping 60 seconds to wait for Graphite to be deployed"
sleep 60

echo "Running confd to obtain Graphite host IP address for the graphite.host value"
/usr/bin/confd -onetime -backend rancher -prefix /latest -log-level debug

echo "Updating the API"
/usr/local/bin/update.sh
echo "API Updated. Process completed, exiting"

exit 0
