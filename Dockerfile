FROM alpine:3.6

ARG BRANCH=3.1.2
ARG WORK=~

COPY config.json /
RUN apk --no-cache add python \
    libsodium \
    wget


RUN mkdir -p $WORK && \
    wget -qO- --no-check-certificate  https://github.com/yuxizhe/shadowsocksr/archive/$BRANCH.tar.gz | tar -xzf - -C $WORK


WORKDIR $WORK/shadowsocksr-$BRANCH/shadowsocks

RUN touch cron.log
CMD ["tail", "-f" , "cron.log"] 
# CMD python server.py -c /config.json
