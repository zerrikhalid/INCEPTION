#!/bin/bash

sed -i "s/^listen\s*=.*$/listen = 9000/" /etc/php/7.4/fpm/pool.d/www.conf
mkdir -p /var/www/html

cd /var/www/html

wget -O wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

#check if it workds inside the container : php wp-cli.phar --info

chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root

wp config create --dbname=$db --dbuser=$user --dbpass=$password --dbhost='mariadb' --allow-root

wp core install --url='kzerri.42.fr' --title="Inception" --admin_user='kzerri42' --admin_password='pass' --admin_email='kzerri@gmail.com' --allow-root

wp user create $user k@zerri.com --role=author --user_pass='pass' --allow-root

service php7.4-fpm start
service php7.4-fpm stop

php-fpm7.4 -F