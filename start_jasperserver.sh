docker run --name mup_jasper -p 9001:8080 --link mup_mysql:mysql -e MYSQL_HOST=mup_mysql -e MYSQL_PASSWORD=amilo1718 -e MYSQL_PORT=3306 cdorde/myjasperserver:6.2.0
