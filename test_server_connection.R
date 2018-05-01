tst<-function() {
library(XMLRPC)
server<-"http://localhost:7777"
res<-xml.rpc(server,"PathVisio.test")
print(res)
}

tst()

