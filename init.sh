#!/bin/bash

# Create directories
mkdir -p ninja/logo
mkdir -p ninja/storage/framework
mkdir -p ninja/storage/framework/sessions
mkdir -p ninja/storage/framework/views
mkdir -p ninja/storage/framework/cache

# Fix permissions
chmod 775 -R ninja/ && chown -R www-data:www-data ninja/

# Execute docker containers
docker-compose up -d
