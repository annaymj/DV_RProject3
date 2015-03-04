Cerataulina<- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select * from cerataulina"'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL',USER='C##cs329e_my3852', PASS='orcl_my3852',MODE='native_mode',MODEL='model',returnDimensions = 'False',returnFor = 'JSON'),verbose = TRUE)))

Cerataulina %>% tbl_df