#!/bin/bash
service redis-server start
service elasticsearch start
service mysql start
tail -f /dev/null
