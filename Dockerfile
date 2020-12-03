FROM 264318998405.dkr.ecr.us-west-2.amazonaws.com/nginx:stable-alpine-perl
COPY . /usr/share/nginx/html/
RUN date
RUN echo hello
