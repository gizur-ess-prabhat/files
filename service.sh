#!/bin/sh

sudo node lib/redis-dns/server.js &
hipache --config hipache_config.json &
