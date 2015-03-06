full_df1 <- full_join(cyc_avgLen,weiss_avgLen,by="gene_family")
#full_df1 %>% tbl_df
full_df2 <- full_join(full_df1,ocean_avgLen,by="gene_family")
#full_df2 %>% tbl_df
full_df3 <- full_join(full_df2,cera_avgLen,by="gene_family")
#full_df3 %>% tbl_df
full_df <- full_join(full_df3,chaeto_avgLen,by="gene_family")
full_df %>% tbl_df