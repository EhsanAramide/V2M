#!/bin/bash

sudo mv $1 /etc/v2ray/config.json
sudo systemctl restart v2ray.service