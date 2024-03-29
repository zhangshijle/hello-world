# 镜像构建历史：

```bash
#安装go
root@skywalking-agent1:/opt/hello-world# apt  install golang-go

#获取agent
root@skywalking-agent1:/opt/hello-world# go get github.com/apache/skywalking-go
go: downloading github.com/apache/skywalking-go v0.4.0
go: downloading github.com/google/uuid v1.3.0
go: downloading github.com/pkg/errors v0.9.1
go: downloading skywalking.apache.org/repo/goapi v0.0.0-20230314034821-0c5a44bb767a
go: downloading google.golang.org/grpc v1.55.0
go: downloading google.golang.org/protobuf v1.30.0
go: downloading github.com/golang/protobuf v1.5.3
go: downloading github.com/google/go-cmp v0.5.9
go: downloading golang.org/x/net v0.10.0
go: downloading google.golang.org/genproto v0.0.0-20230410155749-daa745c078e1
go: downloading golang.org/x/sys v0.8.0
go: downloading golang.org/x/text v0.9.0

# 源代码加载
root@skywalking-agent1:/opt/hello-world# vim  main.go 
import (
        "fmt"
        "log"
        "net/http"
        _ "github.com/apache/skywalking-go"
        "os"
)

# 编译并添加skywalking-go-agent
root@skywalking-agent1:/opt/hello-world# tar xvf apache-skywalking-go-0.4.0-bin.tgz 
root@skywalking-agent1:/opt/hello-world# export TMPDIR=/tmp/
root@skywalking-agent1:/opt/hello-world# CGO_ENABLED=0 GOOS=linux go build  -toolexec="/opt/hello-world/apache-skywalking-go-0.4.0-bin/bin/skywalking-go-agent-0.4.0-linux-amd64" -a -o  #编译

#系统环境变量
# export SW_AGENT_REPORTER_GRPC_BACKEND_SERVICE=172.31.2.161:11800
# export SW_AGENT_NAME=myserver-go-app2
# docker login -u name -p xxx myserver-cn-north-1.jcr.service.jdcloud.com

#K8S中运行
# kubectl create secret docker-registry secret-name --docker-server=myserver-cn-north-1.jcr.service.jdcloud.com --docker-username=name --docker-password=xxx -n myserver

# kubectl apply  -f 1.hello-world-deployment.yaml -f 2.hello-world-service.yaml
```
