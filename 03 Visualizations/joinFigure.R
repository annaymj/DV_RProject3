sub_df <- tidy_inner_df %>% filter(species %in% c("weiss","cyc","cera","chaeto"))
g<-ggplot(sub_df,aes(x=gene_family,y=avg_length,size=species,color=species)) + geom_point()+ggtitle('Average gene length of \n each gene family') + theme(axis.text.x=element_text(angle=50, vjust=0.5)) + labs(x="Gene Family", y="Average Length")
g

