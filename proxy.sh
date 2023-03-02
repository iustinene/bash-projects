#!/bin/sh

# System proxy:
proxy=proxy.just.ro:8080
[ "$proxy" = DIRECT ] || export http_proxy="http://$proxy" https_proxy="http://$proxy" ftp_proxy="http://$proxy"

# Proxy exceptions:
noproxy=10.*.*.*
[ "$noproxy" ] && export no_proxy="localhost,127.0.0.1,$noproxy" || export no_proxy="localhost,127.0.0.1"
