# kill_process

```sh
| xargs kill -9
```

```sh
ps aux | grep chromium |  awk '{print $2}'  
```

```sh
ps aux | grep /var/www/node/node_ads |  awk '{print $2}'
```

```sh
lsof -i tcp:3000 | grep node | awk '{print $2}'
```