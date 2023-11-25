#!/bin/bash

hostuser="isucon"
hostname="35.79.124.212"

scp "$hostuser@$hostname":/home/isucon/copy_target_log/access.log .
scp "$hostuser@$hostname":/home/isucon/copy_target_log/access_alp.log .
scp "$hostuser@$hostname":/home/isucon/copy_target_log/access_kataribe.log  .
scp "$hostuser@$hostname":/home/isucon/copy_target_log/mysql-slow.log .
scp "$hostuser@$hostname":/home/isucon/copy_target_log/mysql.log .
# ファイル名を補正
cp mysql-slow.log pt-query.log
