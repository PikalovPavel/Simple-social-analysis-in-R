library(igraph)
data <- read.csv("result")
net <- graph.data.frame(data, directed=F)

V(net)$label <- V(net)$name
V(net)$degree <- degree(net)
plot(net,
      vertex.color = rainbow(52),
      vertex.size = 2,
      edge.arrow.size = 0.1,
      layout=layout.auto)


