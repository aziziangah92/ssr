#
# Dockerfile for ShadowsocksR
#

FROM alpine:3.7

ENV SSR_URL https://github.com/shadowsocksr-backup/shadowsocksr/archive/manyuser.zip

RUN set -ex \
    && apk --update add --no-cache libsodium py-pip \
    && pip --no-cache-dir install $SSR_URL \
    && rm -rf /var/cache/apk

ENV SERVER_ADDR 0.0.0.0
ENV SERVER_PORT 443
ENV PASSWORD    yu1234128
ENV METHOD      none
ENV PROTOCOL    auth_chain_a
ENV PROTOCOLPA  154:AtwN3K
ENV OBFS        http_simple
ENV TIMEOUT     300

EXPOSE $SERVER_PORT/tcp
EXPOSE $SERVER_PORT/udp

WORKDIR /usr/bin/

CMD ssserver -s $SERVER_ADDR \
             -p $SERVER_PORT \
             -k $PASSWORD    \
             -m $METHOD      \
             -O $PROTOCOL    \
             -o $OBFS        \
             -t $TIMEOUT     \
             -G $PROTOCOLPA
