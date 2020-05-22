#!/usr/bash

echo "start build linux transponder"

export GOOS=linux

build() {

  rm -rf ../build/linux/${1}_server/

  mkdir -p ../build/linux/${1}_server/bin/
  mkdir -p ../build/linux/${1}_server/config/

  \cp ../config/${1}.yaml ../build/linux/${1}_server/config/

  go build -ldflags "-w -s" -gcflags "all=-N -l" -o ../build/linux/${1}_server/bin ../cmd/${1}_server.go

}

# 内网包
build inner

# 外网
build outer

echo "finish build linux transponder"
