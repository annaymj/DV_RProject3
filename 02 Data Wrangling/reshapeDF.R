names(inner_df) <- c("gene_family","cyc","weiss","ocean","cera","chaeto")
inner_df %>% tbl_df
tidy_inner_df <- gather(inner_df,"species","avg_length",2:6)
tidy_inner_df %>% tbl_df
