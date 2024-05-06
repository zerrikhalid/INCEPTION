#!/bin/bash
service mariadb start

# mariadb -e "CREATE DATABASE IF NOT EXISTS $db;"
# mariadb -e "CREATE USER IF NOT EXISTS $user@'%' IDENTIFIED BY $password;"
# mariadb -e "GRANT ALL PRIVILEGES ON $db.* TO $user@'%';"
# mariadb -e "FLUSH PRIVILEGES;"
# #ensures that any changes made to user privileges are applied without needing to restart 
# #the MariaDB server.
mariadb -e "CREATE DATABASE IF NOT EXISTS db;"
mariadb -e "CREATE USER IF NOT EXISTS 'khalid'@'%' IDENTIFIED BY 'pass';"
mariadb -e "GRANT ALL PRIVILEGES ON db.* TO 'khalid'@'%';"
mariadb -e "FLUSH PRIVILEGES;"
#ensures that any changes made to user privileges are applied without needing to restart 
#the MariaDB server.
service mariadb stop
