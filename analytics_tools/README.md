# Dockerイメージのビルド
```bash
docker build -t analytics_tools .
```

# 必要であれば認証機能を外す

```bash
export DOCKER_CONTENT_TRUST=0
```

# pt-query-stringの実行例

```bash
# pt-query-digestの実行例
# リモートサーバーであらかじめ書き込み権限がある mysql-slow.log を用意しておく（scpで取得したいため）
scp "$hostuser:$hostname":/home/isucon/mysql-slow.log pt-query.log
docker run --rm -v $(pwd)/pt-query.log:/pt-query.log analytics_tools pt-query-digest /pt-query.log

# alpの実行例
# リモートサーバーであらかじめ書き込み権限がある nginx.log を用意しておく（scpで取得したいため）
scp "$hostuser:$hostname":/home/isucon/access_alp.log access_alp.log
docker run --rm -v $(pwd)/access_alp.log:/access_alp.log analytics_tools bash -c "cat /access_alp.log | alp json"

# kataribeの実行例
# リモートサーバーであらかじめ書き込み権限がある nginx.log を用意しておく（scpで取得したいため）
scp "$hostuser:$hostname":/home/isucon/access_kataribe.log access_kataribe.log
docker run --rm -v $(pwd)/access_kataribe.log:/access_kataribe.log analytics_tools bash -c "kataribe -generate && cat /access_kataribe.log | kataribe"
```
