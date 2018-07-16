FROM chunhei2008/php:gd

ADD pcre /tmp/pcre
RUN cd /tmp/pcre \
    && ./configure \
    && make \
    && make install \
    && rm -rf /tmp/pcre

RUN cd /tmp \
    && git clone https://gitee.com/swoole/swoole.git \
    && cd swoole \
    && git checkout -b v2.0.9 \
    && phpize \
    && ./configure --with-php-config=/usr/local/bin/php-config  --enable-coroutine \
    && make \
    && make install \
    && rm -rf /tmp/swoole

ADD docker-php-ext-swoole.ini /usr/local/etc/php/conf.d/
