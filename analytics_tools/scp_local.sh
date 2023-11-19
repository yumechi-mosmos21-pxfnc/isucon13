#!/bin/bash

hostuser="isucon"
hostname="133.242.221.35"

scp "$hostuser@$hostname":/home/isucon/copy_target_log/* .
# ファイル名を補正
cp mysql-slow.log pt-query.log
