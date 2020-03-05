FROM redis:alpine

WORKDIR /data

RUN apk --no-cache add libintl && \
      apk --no-cache add --virtual .gettext gettext && \
      cp /usr/bin/envsubst /usr/local/bin/envsubst && \
      apk del .gettext

COPY ./redis-cluster.conf /data/redis-cluster.conf
COPY ./docker-entrypoint.sh /data/docker-entrypoint.sh

CMD ["sh", "/data/docker-entrypoint.sh"]