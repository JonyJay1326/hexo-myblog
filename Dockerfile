FROM node:8.1-alpine
WORKDIR /app
COPY . /app/
EXPOSE 8888

RUN npm install \
    && npm run build \
    && cp -r public/* /usr/share/nginx \
    && rm -rf /app 

CMD ["nginx","-g","daemon off;"]