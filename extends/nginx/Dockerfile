FROM nginx:1.16.1-alpine

ENV CONF_PATH=/etc/nginx
ENV SSL_PATH=/etc/nginx/ssl

RUN mkdir -p $SSL_PATH
COPY fullchain.pem $SSL_PATH/server.crt
COPY privkey.pem $SSL_PATH/server.key
COPY nginx.conf $CONF_PATH/nginx.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]