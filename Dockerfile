FROM nginx:latest

MAINTAINER "Dorin Brage" dorin.brage@gmail.com

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
WORKDIR ~
RUN curl -sS https://getcomposer.org/installer -o composer-setup.php && \
	php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
	composer global require laravel/installer

WORKDIR /var/www/app/ 
RUN composer install

# Using preconfigured env file and generating app key
RUN cp .env.example .env && \
	php artisan config:clear && \
	php artisan key:generate

# Fix permissions
RUN chown -R $USER:www-data storage && \
	chown -R $USER:www-data bootstrap/cache && \
	chown -R www-data:www-data .env && \
	chmod -R 775 storage/ && \
	chmod -R 775 bootstrap/cache/

EXPOSE 80 443

CMD service php7.0-fpm start && nginx -g 'daemon off;' 