FROM golang:1.3-onbuild
MAINTAINER Martin Hoefling <martin.hoefling@gmx.de>
RUN mkdir /var/discosrv && \
    useradd discosrv && \
    chown discosrv:discosrv /var/discosrv

USER discosrv
EXPOSE 22026/udp
ENTRYPOINT ["/go/bin/app"]
