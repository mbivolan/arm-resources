#!/bin/bash

export WORK_DIR="$(dirname $(readlink -f "$0"))"
export UTILS_DIR="${WORK_DIR}/utils"
export EXAMPLES_DIR="${WORK_DIR}/examples"

function basic_setup {
    apt -y update
    apt -y upgrade
    apt install -y gcc-aarch64-linux-gnu qemu-system-arm make
}

function main {
    if [[ "$1" == "" ]] || [[ "$1" == "help" ]];then
        cat "$UTILS_DIR/help.txt"
        exit 0
    fi

    if [[ "$1" == "setup" ]]; then
        if [[ "$2" == "basic" ]];then
            basic_setup
            exit 0
        fi
    fi
}

main $@