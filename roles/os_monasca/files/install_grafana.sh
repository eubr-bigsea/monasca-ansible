#!/bin/bash

export PATH=$PATH:/usr/local/go/bin
export GOPATH=`pwd`

mkdir -p $GOPATH/src/github.com/grafana
cd $GOPATH/src/github.com/grafana
cp -r /opt/cloned-repos/grafana .
cd grafana
cp -r /opt/cloned-repos/grafana-plugins/datasources/monasca ./public/app/plugins/datasource/
cp /opt/cloned-repos/monasca-ui/grafana-dashboards/* ./public/dashboards/

go run build.go setup
$GOPATH/bin/godep go run build.go build

source /root/.nvm/nvm.sh
nvm install 4.0.0
nvm use 4.0.0
npm config set unsafe-perm true
npm install
npm install -g grunt-cli
grunt --force
