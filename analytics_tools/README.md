# Dockerイメージのビルド
```bash
docker build -t analytics_tools .
```

# ログの用意
## リモートのPC

あらかじめ remote_log_copy.sh を scp しておく

```bash
bash remote_log_copy.sh
```

## ローカルのPC

```bash
bash scp_local.sh
```

# 各種コマンドの実行例

```bash

# 必要であれば認証機能を外す
export DOCKER_CONTENT_TRUST=0

# pt-query-digestの実行例
docker run --rm -v $(pwd)/pt-query.log:/pt-query.log analytics_tools pt-query-digest /pt-query.log

# alpの実行例
docker run --rm -v $(pwd)/access_alp.log:/access_alp.log analytics_tools bash -c "cat /access_alp.log | alp json"

# kataribeの実行例
docker run --rm -v $(pwd)/access_kataribe.log:/access_kataribe.log analytics_tools bash -c "kataribe -generate && cat /access_kataribe.log | kataribe"
```
