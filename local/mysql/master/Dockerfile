FROM mysql:8.0.12

ADD ./default_authentication.cnf /etc/mysql/conf.d/

RUN rm /etc/mysql/my.cnf
ADD ./master.cnf /etc/mysql/my.cnf