FROM openresty/openresty:alpine

RUN mkdir -p /app/logs

WORKDIR /app

COPY ./ ./ 

EXPOSE 6954

CMD ["openresty", "-p", "/app", "-c", "conf/my.conf", "-g", "daemon off;"]