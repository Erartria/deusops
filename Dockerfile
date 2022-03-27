FROM alpine:3.12

RUN apk add nginx && \
    mkdir -p /run/nginx && \
    mkdir /src && \
    touch /run/nginx/nginx.pid

EXPOSE 80

COPY nginx/default.conf /etc/nginx/conf.d/default.conf
VOLUME /src

CMD ["nginx","-g","daemon off;"]

# docker build -t kairgeldin:nginx .
# docker run -d -v ${pwd}\src:/src -p 8080:80 kairgeldin:nginx