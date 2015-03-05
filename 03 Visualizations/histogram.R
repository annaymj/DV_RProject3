#function to draw histogram plot
myplot1 <- function(df, x) {
  names(df) <- c("x")
  ggplot(df, aes(x=x)) + geom_histogram()
}


l_hist <- list()
for (i in names(ocean)) {   
  # For details on [[...]] below, see http://stackoverflow.com/questions/1169456/in-r-what-is-the-difference-between-the-and-notations-for-accessing-the
  if (i %in% categoricals[[2]]) {
    r <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select \\\""i"\\\" from ocean where \\\""i"\\\" is not null "'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL',USER='C##cs329e_my3852', PASS='orcl_my3852',MODE='native_mode',MODEL='model',returnDimensions = 'False',returnFor = 'JSON', i=i),verbose = TRUE)))
    p <- myplot1(r,i)
    print(p) 
    l_hist[[i]] <- p
  }
}

print(l_hist[[1]])
startFig <- l_hist[[1]] + ggtitle('Codon Start Position') + geom_histogram(aes(fill = ..count..)) + theme(legend.position = "none",axis.text.x=element_text(angle=50, vjust=0.5))
print(startFig)


endFig <- l_hist[[2]] + ggtitle('Codon End Position')+ geom_histogram(aes(fill = ..count..)) + theme(legend.position = "none",axis.text.x=element_text(angle=50, vjust=0.5))
print(endFig)

lenFig <- l_hist[[3]] + ggtitle('Gene Length') + geom_histogram(aes(fill = ..count..)) + theme(legend.position = "none",axis.text.x=element_text(angle=50, vjust=0.5))
print(lenFig)

#png("/Users/annayu/Desktop/DataVisualization/DV_RProject3/00 Doc/histogram.png", width = 25, height = 30, units = "in", res = 72)
#grid.newpage()
pushViewport(viewport(layout = grid.layout(3, 4)))   

print(startFig, vp = viewport(layout.pos.row = 1, layout.pos.col = 1:2))
print(endFig, vp = viewport(layout.pos.row = 1, layout.pos.col = 3:4))
print(lenFig, vp = viewport(layout.pos.row = 2:3, layout.pos.col = 1:4))


