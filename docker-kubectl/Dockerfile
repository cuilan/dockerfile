FROM docker:19.03

LABEL maintainer="zhangyan <17746598041@163.com>"

ARG TZ="Asia/Shanghai"

ENV TZ ${TZ}

ENV KUBE_VERSION v1.19.3
ENV KUBECTL_DOWNLOAD_URL https://storage.googleapis.com/kubernetes-release/release/${KUBE_VERSION}/bin/linux/amd64/kubectl

RUN apk upgrade --update \
    && apk add libc6-compat bash nload htop curl tzdata wget ca-certificates git \
    && wget -q ${KUBECTL_DOWNLOAD_URL} -O /usr/bin/kubectl \
    && chmod +x /usr/bin/kubectl \
    && ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime \
    && echo ${TZ} > /etc/timezone \
    && rm -rf /var/cache/apk/*

CMD ["/bin/bash"]
