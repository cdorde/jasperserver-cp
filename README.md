# jasperserver-cp
JasperServer Community Edition 6.2.0 based on platformer/jasperserver-cp-5.6.0-docker.

Thanks platformer!


##Starting container - description

This docker cannot be started singly. First, you must start mysql container. This is because jasperserver uses db for working. When you start mysql container for first time it will initialize default database.

After container is started and ready to accept new client connections, start jasperserver-cp container. First time you start jasperserver container it will initialize database with default data, compile jasperserver with default properties and install jasperserver.war to tomcat webapps directory. It will last for some time (4 to 5 minutes on my computer), so wait until receive message that tomcat server is started.

##Starting mysql container

```
docker run --name <Name for mysql container> -e MYSQL_ROOT_PASSWORD=<Mysql root user password> mysql
```

##Starting jasperserver-cp container

```
docker run --name <Name for jasperserver-cp container> -p <Port where tomcat will server jasperserver>:8080 --link <Name for mysql container>:mysql -e MYSQL_HOST=<Name for mysql container> -e MYSQL_PASSWORD=<Mysql root user password> -e MYSQL_PORT=3306 cdorde/myjasperserver:6.2.0
```

#Accesing web interfejs

In container host web browser open address

```
http://localhost/<Port where tomcat will server jasperserver>/jasperserver
```

Default admin user name is jasperadmin and password is jasperadmin.

Enjoy!
