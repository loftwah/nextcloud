#!/bin/bash

rm -rf /var/run/apache2/apache2.pid

apache2ctl -D FOREGROUND
