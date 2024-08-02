#!/bin/bash

sudo cp $1 /etc/v2ray/config.json
cp $1 $V2M_REPO/current_config.json
sudo systemctl restart v2ray.service