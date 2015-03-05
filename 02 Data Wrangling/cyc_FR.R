cyc_gf_forward <- filter(cyc_gf, DIRECTION == "forward")
cyc_gf_forward %>% tbl_df

cyc_gf_forwardNum <- cyc_gf_forward %>% group_by(gene_family) %>% summarise(forward_gene_num = n())
cyc_gf_forwardNum

cyc_gf_reverse <- filter(cyc_gf, DIRECTION == "reverse")
cyc_gf_reverse %>% tbl_df

cyc_gf_reverseNum <- cyc_gf_reverse %>% group_by(gene_family) %>% summarise(reverse_gene_num = n())
cyc_gf_reverseNum

cyc_gf_num <- cyc_gf %>% group_by (gene_family) %>% summarise(total_gene_num = n())