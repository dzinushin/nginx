#!/bin/sh

docker run --name openresty --rm \
  -v $(pwd)/nginx/conf.d:/etc/nginx/conf.d \
  -v $(pwd)/nginx/html:/usr/local/openresty/nginx/html \
  -v $(pwd)/nginx/lua:/usr/local/openresty/nginx/lua \
  -p 8080:8080 \
  openresty/openresty