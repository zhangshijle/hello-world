#!/bin/bash
TAG=$1

docker buildx build -t  myserver-cn-north-1.jcr.service.jdcloud.com/myserver/hello-world:${TAG} .

docker push myserver-cn-north-1.jcr.service.jdcloud.com/myserver/hello-world:${TAG}
