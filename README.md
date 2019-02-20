# Dockerized Invoice Ninja

Latest official branch dockerized with ssl, also providing a docker-compose.yaml file.

## docker

Just run the following command and try to open http://localhost:80 or https://localhost on your browser.

```
docker run -p 80:80 -p 443:443 nirodg/invoiceninja
```

## docker-compose

1. Execute ```sudo ./init.sh```. This will create the a folder structures under ```ninja/``` for local storage. Userful for checking the logs
2. Defined a mysql instance. For connecting to the mysql please use the host ```db```. For example ```host: db```
   The credentials are defined in the docker-compose 
```
      MYSQL_ROOT_PASSWORD: "ninja"
      MYSQL_DATABASE: "ninja"
      MYSQL_USER: "ninja"
      MYSQL_PASSWORD: "ninja"
```
## Tips

1. You might want to edit/configure the ```.env``` file under the ```/var/www/app/``` folder
2. The SSL certificates are under the ```/opt/ninja/```
3. The passphrase for the SSL is ```ninja```

# Support
Bugs on the invoiceninja app? Please go here https://github.com/invoiceninja/invoiceninja/issues

Bugs on the docker container? Please go here https://github.com/nirodg/invoiceninja/issues
