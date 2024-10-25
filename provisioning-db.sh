#!/bin/bash

#Update e installazione mysql
apt-get update -y
apt-get upgrade -y
apt-get install -y mysql-server

#Configurazione mysql
mysql -e "CREATE USER 'webuser'@'%' IDENTIFIED BY 'Password&1';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'webuser'@'%';"
mysql -e "FLUSH PRIVILEGES;"
mysql -e "CREATE DATABASE test_db;"
mysql -e "CREATE TABLE test_db.test_user ( id int NOT NULL AUTO_INCREMENT, nome varchar(45), cognome varchar(75),PRIMARY KEY (id));"
mysql -e "INSERT INTO test_db.test_user (nome, cognome) values ('Tom','Schillerwein');"

sed -i 's/127.0.0.1/0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf

systemctl restart mysql.service

