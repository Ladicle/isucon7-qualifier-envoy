# envoy image for native jaeger tracer
FROM envoyproxy/envoy:latest
ENV VER v0.4.0
ADD https://github.com/jaegertracing/jaeger-client-cpp/releases/download/$VER/libjaegertracing_plugin.linux_amd64.so /usr/local/lib/libjaegertracing_plugin.so
