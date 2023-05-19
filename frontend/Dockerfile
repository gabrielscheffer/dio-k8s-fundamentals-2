FROM nginx:alpine

COPY html /usr/share/nginx/html

ENV API_URL=${API_URL:-http://backend:8080/}

EXPOSE 80

CMD /bin/sh -c "envsubst < /usr/share/nginx/html/script.js.template > /usr/share/nginx/html/script.js && nginx -g 'daemon off;'"