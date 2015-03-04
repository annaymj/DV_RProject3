l_gf <-list()

l_gf[[1]] <- ggplot(data = cyc_gf,mapping = aes(x = gene_family)) + layer(geom="bar",mapping = aes(fill=DIRECTION))+labs(title = "Cyclotella", x= "Gene Family", y="Gene Number")+ theme(axis.ticks.x=element_blank(), axis.text.x=element_blank()) + theme(legend.position="none")+labs(title='Number of genes in each gene family') + theme(plot.title=element_text(size=13, face="bold", vjust=2))


l_gf[[2]] <- ggplot(data = weiss_gf,mapping = aes(x = gene_family)) + layer(geom="bar",mapping = aes(fill=DIRECTION))+labs(title = "Thalassiosira weissflogii", x= "Gene Family",y="Gene Number")+ theme(axis.ticks.x=element_blank(), axis.text.x=element_blank()) + theme(legend.position="none")

#print(l_gf[[2]])


l_gf[[3]] <- ggplot(data = cera_gf,mapping = aes(x = gene_family)) + layer(geom="bar",mapping = aes(fill=DIRECTION))+labs(title = "Cerataulina daemon", x= "Gene Family",y="Gene Number")+ theme(axis.ticks.x=element_blank(), axis.text.x=element_blank())+ theme(legend.position="none")

#print(l_gf[[3]])

l_gf[[4]] <- ggplot(data = chaeto_gf,mapping = aes(x = gene_family)) + layer(geom="bar",mapping = aes(fill=DIRECTION))+labs(title = "Chaetoceros simplex", x= "Gene Family", y="Gene Number")+theme(axis.ticks.x=element_blank(), axis.text.x=element_blank()) + theme(legend.position="none")
  
#theme(axis.text.x=element_text(angle=50, vjust=0.5))

#png("/Users/annayu/Desktop/DataVisualization/DV_RProject3/00 Doc/R3_figure1.png", width = 15, height = 10, units = "in", res = 72)
#grid.newpage()
pushViewport(viewport(layout=grid.layout(2,4)))
print(l_gf[[1]],vp=viewport(layout.pos.row=1,layout.pos.col=1:2))
print(l_gf[[2]],vp=viewport(layout.pos.row=1,layout.pos.col=3:4))
print(l_gf[[3]],vp=viewport(layout.pos.row=2,layout.pos.col=1:2))
print(l_gf[[4]],vp=viewport(layout.pos.row=2,layout.pos.col=3:4))
