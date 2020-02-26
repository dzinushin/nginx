# nginx

Quickstart with docker

```
docker pull openresty/openresty

docker run --rm -d -p 8080:80 openresty/openresty 

curl localhost:8080


docker run --rm -d -v $(pwd)/docker/conf.d:/etc/nginx/conf.d -v $(pwd)/docker/html:/usr/local/openresty/nginx/html -p 8080:8080 openresty/openresty
```