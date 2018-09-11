#!/bin/bash -xe

# CREATE USER 'exporter'@'localhost' IDENTIFIED BY 'password' WITH MAX_USER_CONNECTIONS 3;
# GRANT PROCESS, REPLICATION CLIENT, SELECT ON *.* TO 'exporter'@'localhost';
vagrant ssh server3 -c \
	"sudo docker run --rm -d --net=host --pid=host quay.io/prometheus/node-exporter \
      && docker run --rm -d --net=host -e DATA_SOURCE_NAME=\"exporter:password@(localhost:3306)\" prom/mysqld-exporter"

# send envoy configuration to /home/isucon/app.yaml
for i in $(seq 1 2); do
    vagrant ssh server$i -c "sudo systemctl stop nginx.service \
      && sudo docker run --rm -d --net=host --pid=host quay.io/prometheus/node-exporter \
      && sudo docker run --rm -d --net=host jaegertracing/jaeger-agent:1.6 --collector.host-port=10.0.1.100:14267 \
      && sudo docker run --rm -d --net=host -v /home/isucon/app.yaml:/etc/envoy/envoy.yaml envoyproxy/envoy"
done
