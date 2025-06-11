# xbot-wechat

本项目为 xbot-wechat，支持一键 Docker 部署。

## 快速启动

1. 构建镜像并启动服务：
   ```sh
   docker-compose up --build
   ```
2. 后台运行：
   ```sh
   docker-compose up -d --build
   ```
3. 停止服务：
   ```sh
   docker-compose down
   ```

## 端口说明

- 8099: ws 服务
- 9011: API 服务
- 9010: 授权码激活服务
