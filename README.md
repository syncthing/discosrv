discosrv
========

[![Latest Build](http://img.shields.io/jenkins/s/http/build.syncthing.net/discosrv.svg?style=flat-square)](http://build.syncthing.net/job/discosrv/lastBuild/)

This is the global discovery server for the `syncthing` project.

`go get github.com/syncthing/discosrv`

Or download the latest [Linux build](http://build.syncthing.net/job/discosrv/lastSuccessfulBuild/artifact/).

To build a Docker image and run the discosrv as Docker container:

`docker build -t discosrv .` and then
`docker run -d -p 22026:22026/udp discosrv`
