FROM invoiceninja/invoiceninja:latest

RUN apt update 
RUN apt install -y nginx nano

COPY default /etc/nginx/sites-enabled/default
