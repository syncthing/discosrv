FROM ubuntu
MAINTAINER Martin Hoefling <martin.hoefling@gmx.de>
ENV GOPATH /root/go
RUN DEBCONF_FRONTEND=noninteractive \
    apt-get update && \
    apt-get install -y golang git mercurial && \
    apt-get clean && \
    mkdir /root/go && \
    cd /root/go && \
    go get github.com/syncthing/discosrv && \
    apt-get remove -y --purge golang git mercurial && \
    apt-get autoremove -y && \
    cp bin/discosrv /usr/local/bin && \
    rm -rf /root/go

EXPOSE 22026/udp

ENTRYPOINT /usr/local/bin/discosrv
