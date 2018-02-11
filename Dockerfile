FROM node:8.1-alpine
# 安装nginx
RUN apt-get update \
    && apt-get install -y nginx
    
WORKDIR /app
COPY . /app/
EXPOSE 8888

RUN npm install \
    && npm run build \
    && cp -r public/* /var/www/html\
    && rm -rf /app \
CMD ["nginx","-g","daemon off;"]