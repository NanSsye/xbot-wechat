FROM ubuntu:24.04

WORKDIR /app

# 拷贝所有文件和目录到容器
COPY . /app/

# 赋予可执行权限
RUN chmod +x /app/staydd /app/entrypoint.sh

# 安装 redis-server
RUN apt-get update && apt-get install -y redis-server && apt-get clean && rm -rf /var/lib/apt/lists/*

# 安装 openjdk-17-jre-headless 以支持 Java 程序
RUN sed -i 's|http://archive.ubuntu.com/ubuntu/|http://mirrors.aliyun.com/ubuntu/|g' /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y openjdk-17-jre-headless \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 设置 LD_LIBRARY_PATH，确保 so 文件能被找到
ENV LD_LIBRARY_PATH=/app/lib

# 拷贝 ws 目录到容器
COPY ws /app/ws

# 启动脚本
CMD ["/app/entrypoint.sh"]