FROM php:7-fpm
# Install modules
RUN buildDeps="libpq-dev libzip-dev libicu-dev" && \
    apt-get update && \
    apt-get install -y $buildDeps --no-install-recommends && \
    rm -rf /var/lib/apt/lists/* && \
    docker-php-ext-install \        
        pdo \
        pdo_pgsql \
        pgsql \
        intl
CMD ["php-fpm"]
