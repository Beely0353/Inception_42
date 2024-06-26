FROM		debian:bullseye

RUN			apt update -y && apt upgrade -y && apt install -y wget php\
			php-fpm\
			php-mysql\
			mariadb-client

RUN         wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www && \
            cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz && \
            chown -R root:root /var/www/wordpress

COPY        conf/www.conf /etc/php/8.2/fpm/pool.d/

RUN         wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY        tools/auto_config.sh /usr/local/bin/
RUN         chmod +x /usr/local/bin/auto_config.sh
ENTRYPOINT  ["/usr/local/bin/auto_config.sh"]

EXPOSE      9000
CMD         ["/usr/sbin/php-fpm7.3", "-F"]
