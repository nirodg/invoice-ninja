FROM invoiceninja/invoiceninja:latest

MAINTAINER dorin.brage@gmail.com

RUN apt update 
RUN apt install -y nginx nano


# NGINX configuration
COPY default /etc/nginx/sites-enabled/default

COPY nginx.crt /etc/nginx/
COPY nginx.key /etc/nginx/

RUN /etc/init.d/nginx reload

EXPOSE 80 443
