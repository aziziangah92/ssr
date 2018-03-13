FROM alpine:3.6

ENV SERVER_ADDR     0.0.0.0
ENV SERVER_PORT     443
ENV PASSWORD        yu1234128
ENV METHOD          none
ENV PROTOCOL        auth_chain_a
ENV PROTOCOLPARAM   154:AtwN3K
ENV OBFSPARAM       718a8154.vali-dns.cp31.ott.cibntv.net
ENV OBFS            http_simple
ENV TIMEOUT         300
ENV DNS_ADDR        8.8.8.8
ENV DNS_ADDR_2      8.8.4.4

ARG BRANCH=manyuser
ARG WORK=~

COPY config.json /
RUN apk --no-cache add python \
    libsodium \
    wget


RUN mkdir -p $WORK && \
    wget -qO- --no-check-certificate  https://github.com/yuxizhe/shadowsocksr/archive/3.1.2.tar.gz | tar -xzf - -C $WORK


WORKDIR $WORK/shadowsocksr-$BRANCH/shadowsocks


EXPOSE $SERVER_PORT
CMD python server.py -c /config.json
