FROM alpine

RUN apk update && \
    apk add wget bash && \
    apk add grafana --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/

COPY dashboards/*.json /usr/share/grafana/public/dashboards/

EXPOSE 3000

WORKDIR /usr/share/grafana/bin
CMD grafana-server
