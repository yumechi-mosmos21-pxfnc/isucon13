MYSQL_CONFIG_SRC := ./server_setting/mysql/my.cnf 
MYSQL_CONFIG_DEST := /etc/mysql/my.cnf
MYSQL_SERVICE_NAME := mysql 

NGINX_CONFIG_SRC := ./server_setting/config/nginx.conf
NGINX_CONFIG_DEST := /etc/nginx/nginx.conf
NGINX_SERVICE_NAME := nginx

REDIS_CONFIG_SRC := ./server_setting/redis/redis.conf
REDIS_CONFIG_DEST := /path/to/redis.conf
REDIS_SERVICE_NAME := redis-server

WEBAPP_PROJECT_DIR := /home/isucon/webapp/rust # webappのディレクトリ名
WEBAPP_SERVICE_NAME := isuports # systemctlで使うサービス名

BACKUP_TIMESTAMP = $(shell date --utc '+%Y%m%dT%H%M%S')

.PHONY: noop
noop:


.PHONY: webapp
webapp: 
	$(shell cd $(WEBAPP_PROJECT_DIR); cargo build --release)
	sudo systemctl restart $(WEBAPP_SERVICE_NAME)
# ちょっと待つ
	sleep 3 
	sudo systemctl --no-pager status $(WEBAPP_SERVICE_NAME)


.PHONY: mysql
mysql:
	sudo diff --unified $(MYSQL_CONFIG_DEST) $(MYSQL_CONFIG_SRC) || true
	sudo mv $(MYSQL_CONFIG_DEST) $(MYSQL_CONFIG_DEST).$(BACKUP_TIMESTAMP)
	sudo cp $(MYSQL_CONFIG_SRC) $(MYSQL_CONFIG_DEST)
	sudo systemctl restart $(MYSQL_SERVICE_NAME)
# ちょっと待つ
	sleep 3
	sudo systemctl --no-pager status $(MYSQL_SERVICE_NAME)


.PHONY: nginx
nginx:
	sudo diff --unified $(NGINX_CONFIG_DEST) $(NGINX_CONFIG_SRC) || true
	sudo mv $(NGINX_CONFIG_DEST) $(NGINX_CONFIG_DEST).$(BACKUP_TIMESTAMP)
	sudo cp $(NGINX_CONFIG_SRC) $(NGINX_CONFIG_DEST)
	sudo systemctl restart $(NGINX_SERVICE_NAME)
# ちょっと待つ
	sleep 3
	sudo systemctl --no-pager status $(NGINX_SERVICE_NAME)


.PHONY: redis
redis:
	sudo diff --unified $(REDIS_CONFIG_DEST) $(REDIS_CONFIG_SRC) || true
	sudo mv $(REDIS_CONFIG_DEST) $(REDIS_CONFIG_DEST).$(BACKUP_TIMESTAMP)
	sudo cp $(REDIS_CONFIG_SRC) $(REDIS_CONFIG_DEST)
	sudo systemctl restart $(REDIS_SERVICE_NAME)
# ちょっと待つ
	sleep 3
	sudo systemctl --no-pager status $(REDIS_SERVICE_NAME)

