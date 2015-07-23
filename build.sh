#!/bin/bash
set -euo pipefail
set nullglob

echo Get dependencies
go get -d -tags purego

rm -rf discosrv-*-*

build() {
	export GOOS="$1"
	export GOARCH="$2"
	target="discosrv-$GOOS-$GOARCH"
	go build -v
	mkdir "$target"
	if [ -f discosrv ] ; then
		mv discosrv "$target"
		tar zcvf "$target.tar.gz" "$target"
	fi
	if [ -f discosrv.exe ] ; then
	      	mv discosrv.exe "$target"
		zip -r "$target.zip" "$target"
	fi
}

for goos in linux darwin windows freebsd openbsd netbsd solaris ; do
	build "$goos" amd64
done
for goos in linux windows freebsd openbsd netbsd ; do
	build "$goos" 386
done
build linux arm

# Hack used because we run as root under Docker
if [[ ${CHOWN_USER:-} != "" ]] ; then
	chown -R $CHOWN_USER .
fi
