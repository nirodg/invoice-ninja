#!/bin/bash


sed -i -e 's/@APP_ENV@/'$APP_ENV'/g' .env
sed -i -e 's/@APP_DEBUG@/'$APP_DEBUG'/g' .env
sed -i -e 's/@APP_URL@/'$APP_URL'/g' .env
sed -i -e 's/@APP_CIPHER@/'$APP_CIPHER'/g' .env
sed -i -e 's/@APP_LOCALE@/'$APP_LOCALE'/g' .env
sed -i -e 's/@DB_TYPE@/'$DB_TYPE'/g' .env
sed -i -e 's/@DB_STRICT@/'$DB_STRICT'/g' .env
sed -i -e 's/@DB_HOST@/'$DB_HOST'/g' .env
sed -i -e 's/@DB_DATABASE@/'$DB_DATABASE'/g' .env
sed -i -e 's/@DB_USERNAME@/'$DB_USERNAME'/g' .env
sed -i -e 's/@DB_PASSWORD@/'$DB_PASSWORD'/g' .env

sed -i -e 's/@MAIL_DRIVER@/'$MAIL_DRIVER'/g' .env
sed -i -e 's/@MAIL_PORT@/'$MAIL_PORT'/g' .env
sed -i -e 's/@MAIL_ENCRYPTION@/'$MAIL_ENCRYPTION'/g' .env
sed -i -e 's/@MAIL_HOST@/'$MAIL_HOST'/g' .env
sed -i -e 's/@MAIL_USERNAME@/'$MAIL_USERNAME'/g' .env
sed -i -e 's/@MAIL_FROM_ADDRESS@/'$MAIL_FROM_ADDRESS'/g' .env
sed -i -e 's/@MAIL_FROM_NAME@/'$MAIL_FROM_NAME'/g' .env
sed -i -e 's/@MAIL_PASSWORD@/'$MAIL_PASSWORD'/g' .env

echo "Dot-env file done "