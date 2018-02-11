FROM node:8.1-alpine
# 安装nginx
RUN sudo apt-get update \
    && sudo apt-get install -y nginx

WORKDIR /app
COPY . /app/
EXPOSE 8888

RUN npm install \
    && npm run build \
    && cp -r public/* /var/www/html\
    && rm -rf /app 

CMD ["nginx","-g","daemon off;"]