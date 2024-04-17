#!/bin/bash

LOG_WARN() {
    tput setaf 3; echo "$1"; tput sgr0
}

LOG_ERR() {
    tput setaf 1; echo "$1"; tput sgr0
}

LOG_INF() {
    tput setaf 2; echo "$1"; tput sgr0
}