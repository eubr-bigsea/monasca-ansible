#!/bin/bash

export PATH=$PATH:/usr/local/go/bin
export GOPATH=`pwd`

go get -d github.com/grafana/grafana/...
cd $GOPATH/src/github.com/grafana
sudo rm -r grafana
cp -r /opt/cloned-repos/grafana .
cd grafana
cp -r /opt/cloned-repos/grafana-plugins/datasources/monasca ./public/app/plugins/datasource/
cp /opt/cloned-repos/monasca-ui/grafana-dashboards/* ./public/dashboards/
go run build.go setup
$GOPATH/bin/godep restore
go run build.go build
npm config set unsafe-perm true
npm install
sudo npm install -g grunt-cli
grunt --force
