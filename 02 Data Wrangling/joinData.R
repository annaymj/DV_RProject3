cyc_avgLen <- cyc_gf %>% group_by(gene_family) %>% summarise(cyc_len = mean(LENGTH))
cyc_avgLen %>% tbl_df

weiss_avgLen <- weiss_gf %>% group_by(gene_family) %>% summarise(weiss_len = mean(LENGTH))
weiss_avgLen %>% tbl_df

ocean_avgLen <- ocean_gf %>% group_by(gene_family) %>% summarise(ocean_len = mean(LENGTH))
ocean_avgLen %>% tbl_df

cera_avgLen <- cera_gf %>% group_by(gene_family) %>% summarise(cera_len = mean(LENGTH))
cera_avgLen %>% tbl_df

chaeto_avgLen <- chaeto_gf %>% group_by(gene_family) %>% summarise(chaeto_len = mean(LENGTH))
chaeto_avgLen %>% tbl_df