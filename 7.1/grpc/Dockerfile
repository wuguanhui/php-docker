FROM php:7.1.19-cli
RUN apt-get update && apt-get install -y \
    	libbz2-dev \
	zlib1g-dev \
	libmcrypt-dev \
        libwebp-dev \
        libjpeg-dev \
        libpng-dev \
        libz-dev \
        libxpm-dev \
        libfreetype6-dev \
        && docker-php-ext-configure gd --with-freetype-dir --with-webp-dir --with-jpeg-dir --with-png-dir \
        && docker-php-ext-install -j$(nproc) bz2 mysqli pdo_mysql sockets zip gd

RUN pecl install redis \
    && docker-php-ext-enable redis 

RUN pecl install protobuf \
    && docker-php-ext-enable protobuf

RUN pecl install grpc \
    && docker-php-ext-enable grpc

RUN apt-get update && apt-get install -y git

RUN git clone -b $(curl -L https://grpc.io/release) https://github.com/grpc/grpc \
    && cd grpc \
    && git submodule update --init \
    && make grpc_php_plugin
