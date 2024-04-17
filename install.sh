#!/bin/bash

. ./utils.sh

v2m_home=""
v2m_repo=""
if [[ -z $V2M_HOME ]]; then
    printf "V2M_HOME: (default=$HOME/.v2m, please enter absolute path) => "
    read -r v2m_home
    if [[ -z $v2m_home ]]; then
        v2m_home=$HOME/.v2m
    fi
    LOG_INF "V2M_HOME=$v2m_home"
    LOG_WARN "Please add V2M_HOME to environment variables!"
    mkdir -p $v2m_home
else
    LOG_INF "V2M_HOME variable has been set!"
    v2m_home=$V2M_HOME
    LOG_INF "V2M_HOME=$v2m_home"
fi
mkdir -p $v2m_home/v2m
cp -r ./v2m/* $v2m_home/v2m


if [[ -z $V2M_REPO ]]; then
    printf "V2M_REPO: (default=$HOME/.v2m, please enter absolute path) => "
    read -r v2m_repo
    if [[ -z $v2m_repo ]]; then
        v2m_repo=$HOME/.v2m/repo
    fi
    LOG_INF "V2M_REPO=$v2m_repo"
    LOG_WARN "Please add V2M_REPO to environment variables!"
    mkdir -p $v2m_repo
else
    LOG_INF "V2M_REPO variable has been set!"
    v2m_repo=$V2M_REPO
    LOG_INF "V2M_REPO=$v2m_repo"
fi
mkdir -p $v2m_repo

exe_flag=(1 1)
v2ray_exe=`which v2ray`
if [[ $v2ray_exe ]]; then
    LOG_INF "V2ray: $v2ray_exe"
else
    LOG_WARN "Please install v2ray"
    exe_flag[0]=0
fi

fzf_exe=`which fzf`
if [[ $fzf_exe ]]; then
    LOG_INF "FZF: $fzf_exe"
else
    LOG_WARN "Please install FZF"
    exe_flag[1]=0
fi

err_code=1
for flag in "${exe_flag[@]}"; do
    err_code=$(( $flag & $err_code ))
done
if [[ $err_code -eq 0 ]]; then
    LOG_ERR "Lack of dependency"
    exit 1
fi


printf "V2M_HOME=%s\nV2M_REPO=%s\n" $v2m_home $v2m_repo >$v2m_home/v2m_info

sudo ln -s "$v2m_home/v2m/main.sh" "/usr/bin/v2m"
