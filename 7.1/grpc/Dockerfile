FROM php:7.1.19-fpm
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

RUN apt-get update && apt-get install -y git \
        wget \
        libtool \
        autoconf --fix-missing \
        automake 

RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

RUN wget https://phar.phpunit.de/phpunit-old.phar \
    && chmod +x phpunit-old.phar \
    && mv phpunit-old.phar /usr/bin/phpunit    

RUN cd / \
    && git clone -b $(curl -L https://grpc.io/release) https://github.com/grpc/grpc \
    && cd grpc \
    && git submodule update --init \
    && cd third_party/protobuf \
    && ./autogen.sh \
    && ./configure \
    && make install \
    && cd ../../ \
    && make grpc_php_plugin \
    && cd / \
    && cp /grpc/bins/opt/grpc_php_plugin /usr/bin/grpc_php_plugin \
    && chmod +x /usr/bin/grpc_php_plugin \
    && rm -rf /grpc

ENV LD_LIBRARY_PATH=/usr/local/lib/
