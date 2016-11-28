#!/bin/bash

set -ex

target_go_version="1.7.3"

if [ -d $HOME/golang ]; then
  if [ -e $HOME/golang/bin/go ]; then
    go_version=`$HOME/golang/bin/go version | awk '{print $3}' | sed -e 's/^go//'`
  else
    go_version="0"
  fi
else
  mkdir $GOROOT
  go_version="0"
fi

if [ $go_version != $target_go_version ]; then
  curl -o golang.tar.gz -sL https://golang.org/dl/go$target_go_version.linux-amd64.tar.gz
  rm -rf $HOME/golang
  mkdir -p $HOME/golang
  tar -C $HOME/golang -xzf golang.tar.gz
  mv $HOME/golang/go/* $HOME/golang
  rmdir $HOME/golang/go
  chmod a+w $HOME/golang/src/
fi
