

php-fpm7

while :
do
    mysqladmin -h mysql-service ping
    if [ $? == 0 ]
    then
        break
    fi
    sleep 10
done
echo "Connection with Mysql established."

su -c "/tmp/wpinstall.sh" - www
nginx -g "daemon off;"