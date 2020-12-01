FROM nginx:stable-alpine-perl
COPY . /usr/share/nginx/html/
RUN echo hello
