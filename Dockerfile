FROM invoiceninja/invoiceninja:latest

RUN apt update 
RUN apt install -y nginx nano

COPY nginx.conf /etc/nginx/sites-enabled/default
