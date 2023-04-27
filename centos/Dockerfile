FROM centos:centos7

LABEL maintainer="zhangyan <17746598041@163.com>"

RUN set -ex \
    && sed -e 's|^mirrorlist=|#mirrorlist=|g' \
         -e 's|^#baseurl=http://mirror.centos.org|baseurl=https://mirrors.tuna.tsinghua.edu.cn|g' \
         -i.bak \
         /etc/yum.repos.d/CentOS-*.repo \
    && yum install epel-release -y \
    && sed -e 's!^metalink=!#metalink=!g' \
         -e 's!^#baseurl=!baseurl=!g' \
         -e 's!//download\.fedoraproject\.org/pub!//mirrors.tuna.tsinghua.edu.cn!g' \
         -e 's!//download\.example/pub!//mirrors.tuna.tsinghua.edu.cn!g' \
         -e 's!http://mirrors!https://mirrors!g' \
         -i /etc/yum.repos.d/epel*.repo \
    && yum makecache \
    && yum groupinstall  "Development Tools" -y \
    && yum -y remove mysql MySQL-python perl-DBD-MySQL libnuma.so.1 dovecot exim qt-MySQL perl-DBD-MySQL dovecot qt-MySQL mysql-server mysql-connector-odbc php-mysql mysql-bench libdbi-dbd-mysql mysql-devel-5.0.77-3.el5 httpd php mod_auth_mysql mailman squirrelmail php-pdo php-common php-mbstring php-cli &> /dev/null \
    && yum -y install htop pstree cmake mesa-libGL.x86_64 net-tools.x86_64 git wget screen iotop vim lrzsz tree lsof sysstat net-tools ntp gcc gcc-c++ make libtool autoconf patch unzip automake libxml2 libxml2-devel ncurses ncurses-devel libtool-ltdl-devel libtool-ltdl libpng libpng-devel libjpeg-devel openssl openssl-devel curl curl-devel libxml2 libxml2-devel ncurses ncurses-devel libtool-ltdl-devel libtool-ltdl autoconf automake libaio* numactl.x86_64 sqlite-devel libffi-devel bzip2-devel readline-devel psmisc \
    && cp -R /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && yum clean all \
    && rm -rf /var/cache/yum /var/tmp/yum-*

CMD ["/bin/bash"]
