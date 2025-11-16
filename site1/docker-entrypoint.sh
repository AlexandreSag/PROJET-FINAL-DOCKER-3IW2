#!/bin/sh
set -e

cd /var/www/html

if ! grep -q "^APP_KEY=base64:" .env 2>/dev/null || grep -q "^APP_KEY=$" .env 2>/dev/null; then
    echo "Generating application key..."
    php artisan key:generate --force
fi

mkdir -p storage/app

if [ ! -f storage/app/.db-seeded ]; then
    echo "Running database migrations and seeders..."
    
    until php artisan migrate:fresh --seed --force; do
        echo "Database not ready yet, retrying in 5 seconds..."
        sleep 5
    done
    
    touch storage/app/.db-seeded
    echo "Database initialized successfully!"
else
    echo "Database already initialized, skipping..."
fi

exec php-fpm