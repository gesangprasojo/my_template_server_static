FROM centos:7
ARG ART_NGINX_USER
ARG ART_NGINX_USER_PWD

RUN  yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
     https://rpms.remirepo.net/enterprise/remi-release-7.rpm
RUN  yum update -y

# RUN yum install -y {vim,wget,zip,unzip,sed,gd,gd-devel,gmp-devel,net-tools,ntpdate,ntp,openssh-clients,openssh-server,httpd,openssl-devel,yum-utils,perl,curl,squid,git,cronie,nginx,certbot-nginx}
# Testing
RUN yum install -y {vim,wget,zip,unzip,sed,gd,gd-devel,gmp-devel,net-tools,ntpdate,ntp,openssh-clients,openssh-server,httpd,openssl-devel,yum-utils,perl,curl,squid,git,cronie,nginx,certbot-nginx,autoconf,pkg-config,libssl-dev,libzip-dev,zlib1g-dev,zlib1g-dev}
RUN yum install -y {pcre-devel,php-devel,zlib-devel}
RUN yum install php-pear -y



RUN  yum install -y gcc-c++ make
RUN  yum install -y python36 \
     python36-devel \ 
     python36-setuptools 
RUN  easy_install-3.6 pip
RUN  pip install supervisor
RUN  pip install s3cmd
RUN  yum clean all

RUN useradd -m -p $(openssl passwd -1 $ART_NGINX_USER_PWD) $ART_NGINX_USER