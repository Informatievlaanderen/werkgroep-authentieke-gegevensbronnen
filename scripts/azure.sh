#!/bin/bash

SAS_TOKEN=$1
URL=$2

tar -cvf ../dist.tar *


curl -X PUT -T ../dist.tar -H "x-ms-date: $(date -u)" -H "x-ms-blob-type: BlockBlob" "$URL?$SAS_TOKEN"