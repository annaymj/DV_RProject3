l_cyc_fr <- list()

l_cyc_fr[[1]] <- ggplot(cyc_gf_forwardNum,aes(x=" ",y=forward_gene_num,fill=gene_family)) + geom_bar(width =1, stat = "identity") + coord_polar("y",start = pi/3) + theme(axis.text = element_blank(), axis.ticks = element_blank(), axis.title=element_blank(),panel.grid  = element_blank(), panel.background = element_blank(),panel.border = element_blank(),legend.position = "none")  + labs(title='Cyclotella: Forward genes')

#print(l_cyc_fr[[1]])

l_cyc_fr[[2]] <- ggplot(cyc_gf_reverseNum,aes(x=" ",y=reverse_gene_num,fill=gene_family)) + geom_bar(width =1, stat = "identity") + coord_polar("y",start = pi/3) + theme(axis.text = element_blank(), axis.ticks = element_blank(), axis.title=element_blank(),panel.grid  = element_blank(), panel.background = element_blank(),panel.border = element_blank(),legend.position = "none")  + labs(title='Cyclotella: Reverse genes')

#print(l_cyc_fr[[2]])

l_cyc_fr[[3]] <- ggplot(cyc_gf_num,aes(x=" ",y=total_gene_num,fill=gene_family)) + geom_bar(width =1, stat = "identity") + coord_polar("y",start = pi/3) + theme(axis.text = element_blank(), axis.ticks = element_blank(), axis.title=element_blank(),panel.grid  = element_blank(), panel.background = element_blank(),panel.border = element_blank())  + labs(title='Cyclotella: Total genes')

#print(l_cyc_fr[[3]])

pushViewport(viewport(layout=grid.layout(1,4)))
print(l_cyc_fr[[1]],vp=viewport(layout.pos.row=1,layout.pos.col=1:2))
print(l_cyc_fr[[2]],vp=viewport(layout.pos.row=1,layout.pos.col=3:4))

