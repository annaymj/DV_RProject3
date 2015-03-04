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

#png("/Users/pcannata/Mine/UT/GitRepositories/DataVisualization/RWorkshop/00 Doc/categoricals2.png", width = 25, height = 20, units = "in", res = 72)
#grid.newpage()
pushViewport(viewport(layout = grid.layout(1, 9)))   

print(l_hist[[1]], vp = viewport(layout.pos.row = 1, layout.pos.col = 1:3))
print(l_hist[[2]], vp = viewport(layout.pos.row = 1, layout.pos.col = 4:6))
print(l_hist[[3]], vp = viewport(layout.pos.row = 1, layout.pos.col = 7:9))


