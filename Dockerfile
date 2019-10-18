FROM alpine:3.9
MAINTAINER quericy <quericy@live.com>

ENV NPS_VERSION 0.23.2

WORKDIR /root/nps/

RUN wget --no-check-certificate -O nps_server.tar.gz https://github.com/cnlh/nps/releases/download/v${NPS_VERSION}/linux_amd64_server.tar.gz && \
    tar -xzvf nps_server.tar.gz --strip-components 1 && \
    rm -f nps_server.tar.gz && \
    chmod a+x ./nps


ADD conf/nps.conf conf/nps.conf


# ENTRYPOINT ["sh", "/entrypoint.sh"]
# CMD nohup sh -c '/nps/nps'
ENTRYPOINT ["/root/nps/nps"]
