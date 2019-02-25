FROM nginx:latest

LABEL maintainer "Dorin Brage dorin.brage@gmail.com"

ENV APP_ENV develop
ENV APP_DEBUG false
ENV APP_URL localhost
ENV APP_CIPHER AES-256-CBC
ENV APP_LOCALE en
ENV DB_TYPE mysql
ENV DB_STRICT false
ENV DB_HOST localhost
ENV DB_DATABASE ninja
ENV DB_USERNAME ninja
ENV DB_PASSWORD ninja

ENV MAIL_DRIVER mysql
ENV MAIL_PORT 587
ENV MAIL_ENCRYPTION tls
ENV MAIL_HOST host
ENV MAIL_USERNAME mail
ENV MAIL_FROM_ADDRESS localhost 
ENV MAIL_FROM_NAME mail
ENV MAIL_PASSWORD mail

# Install all needed packages
RUN apt update 
RUN apt install -y nginx nano curl unzip \
	php-fpm php-mcrypt php-cli php-mysql php-gd php-imagick php-recode php-tidy php-xmlrpc php-zip php-common php-curl php-mbstring php-mcrypt php-json php-intl php-exif php-tokenizer php-sockets php-xml php-gmp


# Users nd and roles
RUN usermod -a -G www-data nginx

# Directories
RUN mkdir /opt/ninja/ \
	mkdir -p /var/www/app

# SSL certificates for nginx
COPY --chown=root:root nginx.crt /opt/ninja/
COPY --chown=root:root nginx.key /opt/ninja/

# nginx configuration
COPY default /etc/nginx/conf.d/default.conf

# Invoice Ninja app
COPY invoiceninja/ /var/www/app/
COPY .env /var/www/app/.env
WORKDIR /root/

RUN curl -sS https://getcomposer.org/installer -o composer-setup.php && \
	php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
	composer global require laravel/installer

WORKDIR /var/www/app/
COPY container.sh /container.sh
RUN chmod +x /container.sh

# Add additional forlder structure
RUN mkdir -p storage/framework/views && \
	mkdir -p storage/framework/cache && \
	mkdir -p storage/framework/sessions

# Fix permissions
RUN chown -R $USER:www-data storage && \
	chown -R $USER:www-data bootstrap/cache && \
	chown -R www-data:www-data .env && \
	chmod -R 775 storage/ && \
	chmod -R 775 bootstrap/cache/

# TODO: uncomment this
RUN composer install

# Using preconfigured env file and generating app key
#RUN cp .env.example .env && \
RUN	php artisan config:clear && \
	php artisan key:generate

EXPOSE 80 443

CMD /container.sh && service php7.0-fpm start && nginx -g 'daemon off;' 