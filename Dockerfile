FROM daocloud.io/library/nginx
WORKDIR /app
COPY . /app/
# EXPOSE 8888

RUN cp -r public/* /var/www/html \
    && rm -rf /app
CMD ["nginx","-g","daemon off;"]