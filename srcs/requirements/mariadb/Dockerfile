FROM		debian:bullseye

RUN			apt update -y && apt upgrade -y && apt install -y mariadb-server sudo

COPY        conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY        tools/auto_config.sh /usr/local/bin/

RUN         ls -l /usr/local/bin/auto_config.sh


ENTRYPOINT  ["sh","/usr/local/bin/auto_config.sh"]
