FROM invoiceninja/invoiceninja:latest

MAINTAINER dorin.brage@gmail.com

RUN apt update 
RUN apt install -y nginx nano

COPY default /etc/nginx/sites-enabled/default

EXPOSE 80
