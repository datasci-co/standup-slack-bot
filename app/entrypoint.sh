#!/usr/bin/env bash
./wait-for-it.sh -s -t 900 localhost:5432 -- npm start
