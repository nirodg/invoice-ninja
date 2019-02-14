# Dockerized Invoice Ninja

Latest official branch dockerized, also providing a docker-compose.yaml file.

## docker

Just run the following command and try to open http://localhost:80 or https://localhost on your browser.

```
docker run -p 80:80 -p 443:443 nirodg/invoice-ninja
```

## docker-compose

If you want to use the yaml file, please do ```sudo ./init.sh```

1. Defined a mysql instance. For connecting to the mysql please use the host ```db```. For example ```host: db```
2. This will create the some folder structures under ninja/. This is for local storage



## Tips

1. You might want to edit/configure the ```.env``` file under the ```/var/www/app/``` folder
2. The SSL certificates are under the ```/opt/ninja/```
