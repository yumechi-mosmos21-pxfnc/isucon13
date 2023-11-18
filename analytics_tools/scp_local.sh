#!/bin/bash

hostuser="isucon"
hostname="133.242.221.35"

scp "$hostuser@$hostname":/home/isucon/copy_target_log/mysql-slow.log pt-query.log
scp "$hostuser@$hostname":/home/isucon/copy_target_log/access_alp.log access_alp.log
scp "$hostuser@$hostname":/home/isucon/copy_target_log/access_kataribe.log access_kataribe.log
