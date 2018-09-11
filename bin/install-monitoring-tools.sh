#!/bin/bash -ex

sudo docker run --rm -d -p 9090:9090 \
                -v $(pwd)/config/prometheus.yaml:/var/prometheus.yaml \
                prom/prometheus \
                --config.file=/var/prometheus.yaml

sudo docker run --rm -d -p 3000:3000 grafana/grafana

# sudo docker run --rm -d -p 9411:9411 openzipkin/Zipkin

sudo docker run --rm -d \
  -e COLLECTOR_ZIPKIN_HTTP_PORT=9411 \
  -p 5775:5775/udp \
  -p 6831:6831/udp \
  -p 6832:6832/udp \
  -p 5778:5778 \
  -p 16686:16686 \
  -p 14268:14268 \
  -p 9411:9411 \
  jaegertracing/all-in-one:1.6
