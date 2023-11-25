#!/bin/bash
# リモートで必要なログファイルをコピーして配置するスクリプト
# リモートに scp して使う想定

# ホームディレクトリに copy_target_log ディレクトリを作成
mkdir -p ~/copy_target_log

# nginx のアクセスログをコピー
sudo cp /var/log/nginx/access.log ~/copy_target_log/access.log
sudo cp /var/log/nginx/access_alp.log ~/copy_target_log/access_alp.log
sudo cp /var/log/nginx/access_kataribe.log ~/copy_target_log/access_kataribe.log

# mysql のスロークエリログをコピー
sudo cp /var/log/mysql/mysql-slow.log ~/copy_target_log/mysql-slow.log
# mysql の genneral log をコピー
sudo cp /var/log/mysql/mysql.log ~/copy_target_log/mysql.log

# アクセス権を isucon:isucon に変更
sudo chown -R isucon:isucon ~/copy_target_log
