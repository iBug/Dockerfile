FROM openresty/openresty:alpine

RUN apk update && apk add git --no-cache
COPY files /
CMD ["/usr/local/openresty/bin/openresty", "-c", "conf/custom.conf"]
