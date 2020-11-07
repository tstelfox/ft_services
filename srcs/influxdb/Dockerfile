FROM alpine

RUN apk upgrade && \
    apk add influxdb

# Perhaps O professor went too far with this plan.
# RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/

EXPOSE 8086

CMD influxd run -config /etc/influxdb.conf