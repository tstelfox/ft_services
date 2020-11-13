FROM alpine

RUN apk upgrade
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/

EXPOSE 4999

CMD telegraf