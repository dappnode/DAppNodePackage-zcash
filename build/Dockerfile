FROM debian:stretch-slim
ARG UPSTREAM_VERSION
ENV ZCASH_DIR /home/zcash/.zcash
ENV ZCASH_CONF ${ZCASH_DIR}/zcash.conf
WORKDIR /home/zcash

RUN apt-get update && apt-get -y install apt-transport-https wget gnupg2 && \ 
    wget -qO - https://apt.z.cash/zcash.asc | apt-key add - && \
    echo "deb [arch=amd64] https://apt.z.cash/ stretch main" | tee /etc/apt/sources.list.d/zcash.list && \
    apt-get update && apt-get -y install -y zcash=${UPSTREAM_VERSION#v}

RUN useradd -ms /bin/bash zcash && \
    mkdir -p ${ZCASH_DIR}; \
    chown -R zcash:zcash /home/zcash;

COPY launch-zcashd.sh /usr/local/bin/launch-zcashd.sh

USER zcash

EXPOSE 8233/tcp
VOLUME /home/zcash

ENTRYPOINT ["/bin/bash", "/usr/local/bin/launch-zcashd.sh"]

