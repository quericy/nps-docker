FROM alpine:3.8
MAINTAINER quericy <quericy@live.com>

ENV NPS_VERSION 0.23.2

RUN set -x && \
	wget --no-check-certificate https://github.com/cnlh/nps/releases/download/v${NPS_VERSION}/linux_amd64_server.tar.gz && \ 
    mkdir /nps && \
	tar xzf linux_amd64_server.tar.gz -C /nps && \
	cd /nps && \
	chmod +x nps && \
	cd .. && \
	rm -rf *.tar.gz

WORKDIR /nps
VOLUME /nps/conf

ADD ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]
