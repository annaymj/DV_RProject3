cyc_gf<- cyclotella %>% mutate(gene_family=substr(NAME,1,3)) %>% group_by(gene_family)
cyc_gf %>% tbl_df

weiss_gf<- weiss %>% mutate(gene_family=substr(NAME,1,3)) %>% group_by(gene_family)
weiss_gf %>% tbl_df

cera_gf<- cera %>% mutate(gene_family=substr(NAME,1,3)) %>% group_by(gene_family)
cera_gf %>% tbl_df

chaeto_gf<- chaeto %>% mutate(gene_family=substr(NAME,1,3)) %>% group_by(gene_family)
chaeto_gf %>% tbl_df

