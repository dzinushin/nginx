# nginx

Quickstart with docker

```
docker pull openresty/openresty

docker run --rm -d -p 8080:80 openresty/openresty 

curl localhost:8080


docker run --name openresty --rm \
  -v $(pwd)/docker/conf.d:/etc/nginx/conf.d \
  -v $(pwd)/docker/html:/usr/local/openresty/nginx/html \
  -p 8080:8080 \
  openresty/openresty

curl localhost:8080
curl localhost:8080/lua_content
curl localhost:8080/nginx_var?a=hello,world
curl localhost:8080/proxy

```