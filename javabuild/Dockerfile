FROM {{BASE_IMAGE}}

LABEL maintainer="zhangyan <17746598041@163.com>"

ENV MAVEN_VERSION 3.8.6
ENV MAVEN_CACHE_DIR /data/maven_cache
ENV MAVEN_INSTALL_DIR /usr/local/maven
ENV MAVEN_DOWNLOAD_URL http://mirrors.sonic.net/apache/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz

ENV PATH ${PATH}:${MAVEN_INSTALL_DIR}/bin

RUN set -ex \
    && apt update \
    && apt install unzip -y \
    && curl -sSL ${MAVEN_DOWNLOAD_URL} > apache-maven-${MAVEN_VERSION}-bin.tar.gz \
    && tar -zxf apache-maven-${MAVEN_VERSION}-bin.tar.gz \
    && mv apache-maven-${MAVEN_VERSION} ${MAVEN_INSTALL_DIR} \
    && apt purge -y unzip \
    && rm -rf /var/lib/apt/lists/* \
        apache-maven-${MAVEN_VERSION}-bin.tar.gz

COPY cmvn /usr/local/bin/cmvn

VOLUME ${MAVEN_CACHE_DIR}

CMD ["bash"]
