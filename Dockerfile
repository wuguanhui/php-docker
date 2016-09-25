FROM chunhei2008/php:7.0.10-fpm-memcached
RUN apt-get update && apt-get install -y \
    	libbz2-dev \
	zlib1g-dev \
	libmcrypt-dev \
    && docker-php-ext-install -j$(nproc) bz2 mcrypt mysqli pdo_mysql sockets zip
