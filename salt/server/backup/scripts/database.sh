#!/bin/bash

aws s3 cp \
    --endpoint="$DO_SPACES_ENDPOINT" \
    --expires "$(date -d "$(date --iso-8601=seconds) 1 month" --iso-8601=seconds)" \
    /opt/api-data/api.db \
    "s3://$DO_SPACES_BUCKET/database/$(date +"%Y-%m-%d")-api.db"
