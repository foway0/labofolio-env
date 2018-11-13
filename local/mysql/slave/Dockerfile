FROM mysql:8.0.12

ADD ./default_authentication.cnf /etc/mysql/conf.d/
COPY ./replica.sh /docker-entrypoint-initdb.d

RUN rm /etc/mysql/my.cnf
ADD ./slave.cnf /etc/mysql/my.cnf