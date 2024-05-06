#!/bin/bash

mkdir -p /var/www/html

cd /var/www/html

wget -O wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

#check if it workds inside the container : php wp-cli.phar --info

chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root

wp config create --dbname='db' --dbuser='khalid' --dbpass='pass' --dbhost='mariadb' --allow-root

wp core install --url='kzerri.42.fr' --title="Inception" --admin_user='kzerri42' --admin_password='pass' --allow-root

wp user create khalid khalid@exo.com --role=author --user_pass='pass' --allow-root

/usr/sbin/php-fpm7.4 -F