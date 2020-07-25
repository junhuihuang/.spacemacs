#!/bin/sh

# https://github.com/syl20bnr/spacemacs/tree/develop/layers/+lang/go

export ALL_PROXY=socks5://127.0.0.1:1086
export HTTPS_PROXY=http://127.0.0.1:1087

GO111MODULE=on go get -v golang.org/x/tools/gopls@latest
GO111MODULE=on CGO_ENABLED=0 go get -v -trimpath -ldflags '-s -w' github.com/golangci/golangci-lint/cmd/golangci-lint
go get -u -v golang.org/x/tools/cmd/godoc
go get -u -v golang.org/x/tools/cmd/goimports
go get -u -v golang.org/x/tools/cmd/gorename
go get -u -v golang.org/x/tools/cmd/guru
go get -u -v github.com/cweill/gotests/...
go get -u -v github.com/davidrjenni/reftools/cmd/fillstruct
go get -u -v github.com/fatih/gomodifytags
go get -u -v github.com/godoctor/godoctor
go get -u -v github.com/haya14busa/gopkgs/cmd/gopkgs
go get -u -v github.com/josharian/impl
go get -u -v github.com/rogpeppe/godef
go get -u -v github.com/zmb3/gogetdoc
