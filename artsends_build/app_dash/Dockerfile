FROM centos:7


RUN  yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
     https://rpms.remirepo.net/enterprise/remi-release-7.rpm

RUN yum install -y yum-utils 
RUN yum repolist all
RUN yum-config-manager --disable remi-php*
RUN yum update -y
RUN yum-config-manager --enable remi-php74*

RUN yum -y install php php-zip php-mysql php-mcrypt php-xml php-mbstring php-fpm
#
RUN yum install -y {vim,wget,zip,unzip,sed,gd,gd-devel,gmp-devel,net-tools,ntpdate,ntp,openssh-clients,openssh-server,httpd,openssl-devel,yum-utils,perl,curl,squid,git,cronie,nginx,certbot-nginx}
RUN yum install -y {pcre-devel,php-devel,zlib-devel}
RUN yum install php-pear -y
#
RUN  yum install -y gcc-c++ make
RUN  yum install -y python36 \
     python36-devel \ 
     python36-setuptools 
RUN  easy_install-3.6 pip
RUN  pip install supervisor
RUN  pip install s3cmd
RUN  curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
# ---------------php------------------------
RUN  curl -sL https://rpm.nodesource.com/setup_16.x | bash -
RUN  yum install nodejs -y
#
ARG ART_NGINX_USER
ARG ART_NGINX_USER_PWD
ARG ART_UID

# # # RUN useradd -m -p $(openssl passwd -1 $ART_NGINX_USER_PWD) $ART_NGINX_USER
RUN useradd -G root -u $ART_UID -d /home/$ART_NGINX_USER $ART_NGINX_USER
RUN mkdir -p /home/$ART_NGINX_USER/.composer && chown -R $ART_NGINX_USER:$ART_NGINX_USER /home/$ART_NGINX_USER
RUN chmod 755 /home/$ART_NGINX_USER
RUN /usr/bin/ssh-keygen -A
RUN echo $ART_NGINX_USER_PWD | passwd --stdin $ART_NGINX_USER



RUN mkdir -p /var/log/php-fpm
RUN mkdir -p /var/log/nginx
RUN mkdir -p /var/run/php-fpm
RUN chown -R $ART_NGINX_USER:$ART_NGINX_USER /var/log/php-fpm
RUN chown -R $ART_NGINX_USER:$ART_NGINX_USER /var/log/nginx
RUN chown -R $ART_NGINX_USER:$ART_NGINX_USER /var/run/php-fpm


# RUN  php /joko_dynamic/dirujak.ini/autoscript.php
CMD ["supervisord", "-c" ,"/etc/supervisord.conf"]