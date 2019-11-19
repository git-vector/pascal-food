FROM frolvlad/alpine-fpc AS builder

ADD . /app
WORKDIR /app
RUN fpc Menu.pas

FROM alpine as test
COPY --from=builder /app/Menu  /www/cgi-bin/menu
RUN apk add -U jq
RUN /www/cgi-bin/menu | jq .

FROM alpine
RUN apk add -U bash busybox-extras
COPY --from=builder /app/Menu  /www/cgi-bin/menu
COPY www/ /www/
ENV HTTP=true
EXPOSE 80
CMD httpd -f -h /www


