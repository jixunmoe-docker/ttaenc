ttaenc 编译环境
==============

※ 需要事先安装好 Docker 环境：[Install Docker Engine](https://docs.docker.com/engine/install/)

---

## 构建镜像

```sh
docker build . --tag ttaenc-builder
```

## 构建

```sh
mkdir -p bin
docker run --rm \
    -e "BIN_OWNER=$(id -u):$(id -g)" \
    -v "$PWD/bin:/workspace/bin" \
    -v "$PWD/scripts:/scripts" \
    ttaenc-builder
```

构建好的文件将放到 `bin` 目录。

## 删除镜像

```sh
docker rmi ttaenc-builder
```
