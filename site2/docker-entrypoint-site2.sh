#!/bin/sh
set -e

cd /var/www/html

if ! grep -q "^APP_KEY=base64:" .env 2>/dev/null || grep -q "^APP_KEY=$" .env 2>/dev/null; then
    echo "Generating application key..."
    php artisan key:generate --force
fi

exec php-fpm