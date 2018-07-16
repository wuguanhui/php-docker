FROM chunhei2008/php:gd

ADD pcre /tmp/pcre
RUN cd /tmp/pcre \
    && ./configure \
    && make \
    && make install \
    && rm -rf /tmp/pcre

RUN pecl install swoole

ADD docker-php-ext-swoole.ini /usr/local/etc/php/conf.d/
