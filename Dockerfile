FROM ubuntu:mantic-20230712
#
RUN apt-get update && \
    apt-get install -y vim wget zip unzip sed libgd-dev libgmp-dev iproute2 ntpdate ntp openssh-client openssh-server apache2 libssl-dev apt-utils perl curl squid git cron nginx && \
    apt-get install -y libssl-dev libzip-dev zlib1g-dev && \
    apt-get install -y certbot python3-certbot-nginx && \
    apt-get install -y autoconf pkg-config
#
RUN apt-get update && apt-get install -y nginx
RUN apt-get install -y supervisor
RUN apt-get install -y nginx
#
#
RUN mkdir -p /etc/nginx/server_dari_block
RUN mkdir -p /etc/supervisor/conf.d
RUN mkdir -p /Area/app1
COPY supervisord/master_conf/supervisord.conf /etc/supervisor/supervisord.conf
#
CMD ["supervisord", "-c", "/etc/supervisor/supervisord.conf"]
#
