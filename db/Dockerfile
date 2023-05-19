FROM mariadb:10.6

ENV DB=${DB:-/var/lib/mysql/} MARIADB_ROOT_PASSWORD=${MARIADB_ROOT_PASSWORD:-qwerty.1234} MARIADB_DATABASE=${MARIADB_DATABASE:-desafio2}

WORKDIR $DB

COPY *.sql /docker-entrypoint-initdb.d/

EXPOSE 3306