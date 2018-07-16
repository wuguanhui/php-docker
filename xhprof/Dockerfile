FROM chunhei2008/php:gd

RUN cd /tmp \
    && git clone https://github.com/longxinH/xhprof.git ./xhprof \   
    && cd xhprof/extension/ \
    && phpize \
    && ./configure --with-php-config=/usr/local/bin/php-config \
    && make \
    && make install \
    && rm -rf /tmp/xhprof

ADD docker-php-ext-xhprof.ini /usr/local/etc/php/conf.d/   
