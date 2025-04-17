# Alpine 基础镜像

这是一个基于 Alpine Linux 的基础镜像，包含了常用的开发工具和配置。

## 包含的软件包

- bash
- tzdata (配置后删除)
- bind-tools
- busybox-extras
- ca-certificates
- libc6-compat
- vim
- wget
- curl
- jq
- git

## 配置

- 使用阿里云镜像源
- 时区设置为 Asia/Shanghai
- 默认使用 /bin/bash 作为入口点

## 支持的版本

- 3.18
- 3.19
- 3.20
- 3.21

## 构建方法

```bash
# 进入镜像目录
cd images/alpine

# 执行构建脚本
./build.sh
```

## 使用示例

```dockerfile
FROM reg.cuilan.com/alpine:3.20

# 你的应用配置
...
``` 