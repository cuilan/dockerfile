FROM openjdk:oraclelinux8

LABEL maintainer="zhangyan <17746598041@163.com>"

ARG PROFILE
ARG JAVA_OPTS
ARG SRC_PATH

ENV PROFILE ${PROFILE}
ENV JAVA_OPTS ${JAVA_OPTS}
ENV SRC_PATH ${SRC_PATH}

WORKDIR /javarun

COPY ${SRC_PATH} .

CMD ["bash","-c","java -jar -Dspring.profiles.active=${PROFILE} ${JAVA_OPTS} *.jar"]
