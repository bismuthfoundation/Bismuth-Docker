FROM jfloff/alpine-python:3.7-onbuild

MAINTAINER dev@eggpool.net

EXPOSE 8155

RUN set -ex ;\
    apk add --update --no-cache \
    bash \
    ca-certificates \
    curl wget ; \
    git clone https://github.com/bismuthfoundation/WalletServer.git /WalletServer ;\
    cd /WalletServer ; \
    rm -rf /var/cache/apk/*; \
    rm -rf ~/.cache/pip/; \
    mkdir -p bak /custom /Bismuth/static; \
    cp config.txt bak;


#COPY auto bootstrap util
COPY start.sh /start.sh

# Config config_custom.txt

VOLUME /custom /Bismuth/static

WORKDIR /WalletServer

CMD /start.sh
