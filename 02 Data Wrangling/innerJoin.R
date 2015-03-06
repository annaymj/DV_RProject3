inner_df1 <- inner_join(cyc_avgLen,weiss_avgLen,by="gene_family")
inner_df2 <- inner_join(inner_df1,ocean_avgLen,by="gene_family")
inner_df3 <- inner_join(inner_df2,cera_avgLen,by="gene_family")
inner_df <- inner_join(inner_df3,chaeto_avgLen,by="gene_family")
inner_df %>% tbl_df