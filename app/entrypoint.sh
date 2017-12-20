#!/usr/bin/env bash
if [[ ! -s /app/.env ]]; then
    echo "NOTE: using SLACK_TOKEN ($SLACK_TOKEN) provided in ENV"
    echo "SLACK_TOKEN=${SLACK_TOKEN}" > /app/.env
fi

./wait-for-it.sh -s -t 900 localhost:5432 -- npm start
