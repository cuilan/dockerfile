FROM golang:1.17-alpine

LABEL maintainer="zhangyan <17746598041@163.com>"

ENV GOPROXY https://goproxy.cn

ENV TINI_VERSION v0.19.0
ENV TINI_DOWNLOAD_URL https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-amd64

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

# RUN set -ex \ 
#     && apk add tzdata \
#     && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
#     && echo "Asia/Shanghai" > /etc/timezone \
#     && apk del tzdata \
#     && apk update && apk upgrade \
#     && apk add --no-cache bash git openssh curl wget \
#     && curl -sSL ${TINI_DOWNLOAD_URL} > /usr/bin/tini \
#     && chmod +x /usr/bin/tini

RUN set -ex \ 
    && apk add tzdata \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && apk del tzdata \
    && apk update && apk upgrade \
    && apk add --no-cache bash git openssh curl wget ca-certificates groff less py-pip vim rsync \
    && mkdir /root/.pip \
    && echo -e '[global]\ntrusted-host = pypi.doubanio.com\nindex-url = http://pypi.doubanio.com/simple/' >> /root/.pip/pip.conf \ 
    && pip install pip --upgrade \
    && pip install awscli \
    && curl -sSL ${TINI_DOWNLOAD_URL} > /usr/bin/tini \
    && chmod +x /usr/bin/tini 

CMD ["bash"]