tst<-function() {
library(XMLRPC)
server<-"http://localhost:1234"
try({res<-xml.rpc(server,"PathVisio.test"); print(res)})
server<-"http://localhost:4567"
try({res<-xml.rpc(server,"PathVisio.test"); print(res)})
}

tst()

