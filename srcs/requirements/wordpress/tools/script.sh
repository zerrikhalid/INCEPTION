#!/bin/bash

sed -i "s/^listen\s*=.*$/listen = 9000/" /etc/php/7.4/fpm/pool.d/www.conf
mkdir -p /var/www/html

cd /var/www/html

wget -O wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

#check if it workds inside the container : php wp-cli.phar --info

chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root

wp config create --dbname=$db --dbuser=$user --dbpass=$password --dbhost=$dbhost --allow-root

wp core install --url=$url --title=$title --admin_user=$admin_user --admin_password=$admin_pass --admin_email=$admin_email --allow-root

wp user create $user1 $mail --role=author --user_pass=$user_pass --allow-root

php-fpm7.4 -F