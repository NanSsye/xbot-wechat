#!/bin/bash

# 启动 redis-server（后台）
redis-server --daemonize yes

# 启动 ws 服务（Java jar，后台）
cd /app/ws && nohup bash startLinux.sh > /app/ws/ws.log 2>&1 &
cd /app

# 启动主程序（前台）
exec ./staydd
