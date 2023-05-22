FROM php:8.1-fpm

# Arguments defined in docker-compose.yml
ARG user
ARG uid

# Set working directory
WORKDIR /var/www

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    sudo \
    zip \
    unzip \
    netcat \
    nano \
    librdkafka-dev

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Install ext-rdkafka
RUN pecl install rdkafka && echo "extension=rdkafka.so" > /usr/local/etc/php/conf.d/rdkafka.ini

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Create system user to run Composer and Artisan Commands
RUN useradd -G www-data,root -u $uid -d /home/$user $user
RUN mkdir -p /home/$user/.composer && \
    chown -R $user:$user /home/$user

# Deployment steps
COPY . .

COPY .env.example .env

RUN composer install --optimize-autoloader --no-dev

RUN composer require mateusjunges/laravel-kafka

RUN php artisan vendor:publish --provider="Mateusjunges\Kafka\KafkaServiceProvider"

RUN chown -R $user:$user \
    /var/www/storage \
    /var/www/bootstrap/cache \
    /var/www/run.sh

USER $user

RUN php artisan key:generate
RUN php artisan route:clear
RUN php artisan cache:clear
RUN php artisan config:clear
RUN php artisan view:clear

CMD ["php-fpm"]
