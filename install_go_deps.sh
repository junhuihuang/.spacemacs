#!/bin/sh

# https://github.com/syl20bnr/spacemacs/tree/master/layers/%2Blang/go

go get -u -v github.com/nsf/gocode
go get -u -v github.com/rogpeppe/godef
go get -u -v golang.org/x/tools/cmd/guru
go get -u -v golang.org/x/tools/cmd/gorename
go get -u -v golang.org/x/tools/cmd/goimports
go get -u -v github.com/alecthomas/gometalinter
go get -u -v github.com/onsi/gomega
gometalinter --install --update

# 配置 gocode
# gocode 的配置文件在 ~/.config/gocode/config.json
gocode set autobuild true
