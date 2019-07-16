FROM jfloff/alpine-python:3.7-onbuild

MAINTAINER dev@eggpool.net

EXPOSE 5658

#COPY build-requirements.txt /build-requirements.txt

RUN set -ex ;\
    apk add --update --no-cache \
    bash \
    ca-certificates \
    libffi-dev \
    curl wget ; \
    git clone https://github.com/bismuthfoundation/Bismuth.git /Bismuth ;\
    cd /Bismuth ; \
    git checkout postfork; \
    pip install --upgrade --no-cache-dir coincurve; \
    rm -rf /var/cache/apk/*; \
    rm -rf ~/.cache/pip/; \
    cp -r static static.ref; \
    mkdir -p bak /custom plugins/500_hypernode; \
    chmod +x commands.py demo_getaddresssince.py; \
    cp config.txt bak; \
    cp peers.txt bak; \
    cp suggested_peers.txt bak; \
    cd plugins/500_hypernode; \
    wget https://raw.githubusercontent.com/bismuthfoundation/hypernode/master/node_plugin/__init__.py; 
    # git reset --hard 91f8504a15120ef6815d6e10cc7dee42eebaab0f ;


#COPY auto bootstrap util
COPY start.sh /start.sh
COPY stop.sh /stop.sh
#COPY bootstrap_node.sh /Bismuth/bootstrap_node.sh
#COPY reset_node.sh /Bismuth/reset_node.sh
# COPY static.ref to static


# Config config_custom.txt

VOLUME /custom /Bismuth/static

WORKDIR /Bismuth

CMD /start.sh
