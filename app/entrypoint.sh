#!/usr/bin/env bash
./wait-for-it.sh -s -t 900 ${DATABASE_HOST:-localhost:5432} -- npm start
