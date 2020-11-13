#!/bin/bash

service mysql start
echo "CREATE DATABASE wp_db;" | sudo mysql -u root
echo "GRANT ALL ON wp_db.* TO 'wpuser'@'localhost' identified by 'pass';" | sudo mysql -u root
echo "FLUSH PRIVILEGES;" | sudo mysql -u root