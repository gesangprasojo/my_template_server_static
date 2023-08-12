function api_cron(){
cd /Area/dash && php artisan schedule:run;
}

function request_ssl_tmp(){
su - root <<!
mainPWD-1891
certbot certonly \
--nginx \
--non-interactive \
--config-dir /etc/nginx/mycertificat \
--work-dir /etc/nginx/mycertificat/ssl \
--logs-dir /etc/nginx/mycertificat/ssl_log \
--agree-tos -m me@gesangprasojo.com -d demo.naturalfarm.id -d demoapi.naturalfarm.id -d demodash.naturalfarm.id --expand
chown -R prod:prod /etc/nginx/mycertificat
!
}
function reload_spesific_1(){
su - root <<!
mainPWD-1891
supervisorctl restart dev1_website
supervisorctl restart nginx
exit
!
}
function reload_spesific_2(){
su - root <<!
mainPWD-1891
supervisorctl restart dev2_website
supervisorctl restart nginx
exit
!
}
function env_tmp_http(){
cat /etc/nginx/serverblock/nf_attr/tmp_http.txt > /etc/nginx/serverblock/nf_router.conf;
reload_all
}
function env_tmp_https(){
cat /etc/nginx/serverblock/nf_attr/tmp_https.txt > /etc/nginx/serverblock/nf_router.conf;
reload_all
}
function seft_apply_web(){
su - prod <<!
mainPWD-1991
cd /Area/web
git checkout -f
git pull origin master
npm run generate
exit
!
su - root <<!
mainPWD-1891
supervisorctl restart naturalfarm
supervisorctl restart nginx
exit
!
}
function hard_apply_web(){
su - root <<!
mainPWD-1891
cd /Area/web
rm -rf dist/ .nuxt/ node_modules/
exit
!
su - prod <<!
mainPWD-1991
cd /Area/web
git checkout -f
git pull origin master
npm install
npm run build && npm run generate
exit
!
su - root <<!
mainPWD-1891
supervisorctl restart naturalfarm
nginx -s reload
exit
!
}
function alert(){
    clear;
    echo -e "\e[1;31mHallo User ................... !!!!!!!!! \e[0m";
    echo "Type : 'fn' to use naturalfarm function ";
}
function copy_asset(){
su - prod <<!
mainPWD-1991
rsync -r --delete root@naturalfarm.id:/home/naturalfarm/www/dashboard/public/images/ /Area/dash/public/images/
heroSSH-1991NF
exit
!
}
function fn(){
    echo "# List Function :";
    echo "[1]." "Reload Service dev 1";
    echo "[2]." "Reload Service dev 2";
    echo -e "\e[1;31mType number function : \e[0m";
    read fn
    # if  [ "$fn" = "1" ]; then
        # seft_apply_web
    # fi
    if  [ "$fn" = "2" ]; then
        reload_spesific_2
    fi
    if  [ "$fn" = "1" ]; then
        reload_spesific_1
    fi
}
