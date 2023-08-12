FROM centos:7

RUN  yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
     https://rpms.remirepo.net/enterprise/remi-release-7.rpm

# RUN yum install -y {vim,wget,zip,unzip,sed,gd,gd-devel,gmp-devel,net-tools,ntpdate,ntp,openssh-clients,openssh-server,httpd,openssl-devel,yum-utils,perl,curl,squid,git,cronie,nginx,certbot-nginx}
# Testing
RUN  yum -y install yum-utils
RUN yum-config-manager --disable 'remi-php*'
RUN yum-config-manager --enable remi-php80

# RUN yum install -y {pcre-devel,php-devel,zlib-devel}
# RUN yum install php-pear -y




# RUN yum -y install php-mysql.x86_64 --skip-broken

# RUN  yum install -y gcc-c++ make
# RUN  yum install -y python36 \
#      python36-devel \ 
#      python36-setuptools 
# RUN  easy_install-3.6 pip
# RUN  pip install supervisor
# RUN  pip install s3cmd
# ---------------php 8 ------------------------



# RUN  curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
# ---------------php------------------------

# ---------------php 7------------------------
# RUN  yum-config-manager --disable remi-php*
# RUN  yum-config-manager --enable remi-php74
# RUN  yum install php php-cli -y
# RUN  yum install php php-cli php-fpm php-mysqlnd php-zip php-devel php-gd phpN-mcrypt php-mbstring php-curl php-xml php-pear php-bcmath php-json -y
# RUN  yum -y install php-mysql.x86_64 --skip-broken
# RUN  curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
# ---------------php------------------------


# RUN  curl -sL https://rpm.nodesource.com/setup_16.x | bash -
# RUN  yum install nodejs -y

ARG ART_NGINX_USER
ARG ART_NGINX_USER_PWD
RUN useradd -m -p $(openssl passwd -1 $ART_NGINX_USER_PWD) $ART_NGINX_USER



# RUN  php /joko_dynamic/dirujak.ini/autoscript.php
# CMD ["supervisord", "-c" ,"/etc/supervisord.conf"]