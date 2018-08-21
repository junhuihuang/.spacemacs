#!/bin/sh

# https://github.com/syl20bnr/spacemacs/tree/master/layers/%2Blang/go

http_proxy=http://127.0.0.1:8118 https_proxy=http://127.0.0.1:8118 go get -u -v github.com/nsf/gocode
http_proxy=http://127.0.0.1:8118 https_proxy=http://127.0.0.1:8118 go get -u -v github.com/rogpeppe/godef
http_proxy=http://127.0.0.1:8118 https_proxy=http://127.0.0.1:8118 go get -u -v golang.org/x/tools/cmd/guru
http_proxy=http://127.0.0.1:8118 https_proxy=http://127.0.0.1:8118 go get -u -v golang.org/x/tools/cmd/gorename
http_proxy=http://127.0.0.1:8118 https_proxy=http://127.0.0.1:8118 go get -u -v golang.org/x/tools/cmd/goimports
http_proxy=http://127.0.0.1:8118 https_proxy=http://127.0.0.1:8118 go get -u -v github.com/zmb3/gogetdoc
http_proxy=http://127.0.0.1:8118 https_proxy=http://127.0.0.1:8118 go get -u -v github.com/cweill/gotests/...
http_proxy=http://127.0.0.1:8118 https_proxy=http://127.0.0.1:8118 go get -u -v github.com/haya14busa/gopkgs/cmd/gopkgs
http_proxy=http://127.0.0.1:8118 https_proxy=http://127.0.0.1:8118 go get -u -v github.com/davidrjenni/reftools/cmd/fillstruct
http_proxy=http://127.0.0.1:8118 https_proxy=http://127.0.0.1:8118 go get -u -v github.com/josharian/impl
http_proxy=http://127.0.0.1:8118 https_proxy=http://127.0.0.1:8118 go get -u -v github.com/godoctor/godoctor

http_proxy=http://127.0.0.1:8118 https_proxy=http://127.0.0.1:8118 go get -u -v github.com/alecthomas/gometalinter
http_proxy=http://127.0.0.1:8118 https_proxy=http://127.0.0.1:8118 go get -u -v github.com/onsi/gomega

#gometalinter --install --update

# 配置 gocode
# gocode 的配置文件在 ~/.config/gocode/config.json
gocode set autobuild true
