FROM jfloff/alpine-python:3.7-onbuild

MAINTAINER dev@eggpool.net

EXPOSE 8115

RUN set -ex ;\
    apk add --update --no-cache \
    bash \
    ca-certificates \
    curl wget ; \
    git clone https://github.com/bismuthfoundation/BismuthRPC.git /BismuthRPC ;\
    cd /BismuthRPC/RPCServer ; \
    rm -rf /var/cache/apk/*; \
    rm -rf ~/.cache/pip/; \
    mkdir -p bak /custom /Bismuth/static .wallet; 


#COPY auto bootstrap util
COPY start.sh /start.sh

# Config config_custom.txt

VOLUME /custom /Bismuth/static /BismuthRPC/RPCServer/.wallet

WORKDIR /BismuthRPC/RPCServer

CMD /start.sh
