## DV_RProject3
========================================================
#### Group member: Anna Mengjie Yu (my3852),  Duy Vu (dhv242),  Syed Naqvi (san724)

With the advent of next generation sequencing, the sequencing cost per genome is decreasing significantly. Gene content and gene order has been useful in studying species evolution and ecological adaptation. Good data visualization tools will help community better understand the evolution story underneath the data. In this project, we will be using diatom plastid genome data from several diatom species. Each species may or may not share the same gene content due to environment selection. Difference tables can be joined by the gene names.

The tables contain plastid genome gene content, gene length and gene order, and they are accessible from Supporting Information in Yu's publicaiton. [http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0107854]

*********
Load packages


```r
source("../01 Data/loadPackage.R", echo = TRUE)
```

```
## 
## > require("ggplot2")
```

```
## Loading required package: ggplot2
```

```
## 
## > require("gplots")
```

```
## Loading required package: gplots
## 
## Attaching package: 'gplots'
## 
## The following object is masked from 'package:stats':
## 
##     lowess
```

```
## 
## > require("grid")
```

```
## Loading required package: grid
```

```
## 
## > require("RCurl")
```

```
## Loading required package: RCurl
## Loading required package: bitops
```

```
## 
## > require("reshape2")
```

```
## Loading required package: reshape2
```

```
## 
## > require("tidyr")
```

```
## Loading required package: tidyr
```

```
## 
## > require("dplyr")
```

```
## Loading required package: dplyr
## 
## Attaching package: 'dplyr'
## 
## The following object is masked from 'package:stats':
## 
##     filter
## 
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
```

```
## 
## > require("jsonlite")
```

```
## Loading required package: jsonlite
## 
## Attaching package: 'jsonlite'
## 
## The following object is masked from 'package:utils':
## 
##     View
```

*********
First, we displayed a few lines of the dataset stored in oracle database. The table includes Name(gene name), MINIMUM (gene start position), MAXIMUM(gene end position), LENGTH(gene length), DIRECTION(sense and anti-sense strand).

**Table 1: Cyclotella**

```r
source("../01 Data/cyclotella.R", echo = TRUE)
```

```
## 
## > cyclotella <- data.frame(eval(parse(text = substring(getURL(URLencode("http://129.152.144.84:5001/rest/native/?query=\"select * from cyclotella\""), .... [TRUNCATED] 
## 
## > cyclotella %>% tbl_df
## Source: local data frame [180 x 5]
## 
##              NAME BEGIN   END LENGTH DIRECTION
## 1       psaA gene   103 2,361  2,259   forward
## 2       psaB gene 2,478 4,679  2,202   forward
## 3       petF gene 4,912 5,244    333   reverse
## 4      rpl20 gene 5,425 5,844    420   reverse
## 5      rpl35 gene 5,854 6,048    195   reverse
## 6      ycf42 gene 6,055 6,690    636   reverse
## 7       psaE gene 6,792 6,989    198   reverse
## 8  trnR(ucu) gene 7,154 7,226     73   reverse
## 9  trnV(uac) gene 7,237 7,308     72   reverse
## 10      psbH gene 7,575 7,775    201   reverse
## ..            ...   ...   ...    ...       ...
```

*********
**Table 2: Thalassiosira weissflogii**
Thalassiosira weissflogii is a closely related species to Cyclotella. They both belong to the same Thalassiosirales family.


```r
source("../01 Data/weiss.R", echo = TRUE)
```

```
## 
## > weiss <- data.frame(fromJSON(getURL(URLencode("129.152.144.84:5001/rest/native/?query=\"select * from weiss\""), 
## +     httpheader = c(DB = "jdbc:or ..." ... [TRUNCATED] 
## 
## > weiss %>% tbl_df
## Source: local data frame [180 x 5]
## 
##              NAME MINIMUM MAXIMUM LENGTH DIRECTION
## 1      rpl32 gene 120,353 120,517    165   reverse
## 2       psbY gene 120,762 120,872    111   reverse
## 3       rrn5 rRNA 121,057 121,182    126   reverse
## 4             rns 121,332 124,090  2,759   reverse
## 5   trnA-UGC gene 124,179 124,251     73   reverse
## 6   trnI-GAU gene 124,254 124,327     74   reverse
## 7             rnl 124,384 125,860  1,477   reverse
## 8      ycf89 gene 126,149 127,111    963   reverse
## 9  trnP(ugg) gene 127,458 127,531     74   forward
## 10      psaA gene     142   2,400  2,259   forward
## ..            ...     ...     ...    ...       ...
```

*********
**Table 3: Cerataulina daemon**
Cerataulina daemon is more closely related to Chaetoros simplex than the two Thalassiosirales.

```r
source("../01 Data/cerataulina.R", echo = TRUE)
```

```
## 
## > cera <- data.frame(fromJSON(getURL(URLencode("129.152.144.84:5001/rest/native/?query=\"select * from cerataulina\""), 
## +     httpheader = c(DB = "jd ..." ... [TRUNCATED] 
## 
## > cera %>% tbl_df
## Source: local data frame [169 x 5]
## 
##             NAME MINIMUM MAXIMUM LENGTH DIRECTION
## 1      psaA gene     362   2,620  2,259   forward
## 2      psaB gene   2,712   4,913  2,202   forward
## 3  trnD-GUC gene   5,037   5,110     74   reverse
## 4  trnS-GCU gene   5,175   5,260     86   reverse
## 5  trnI-CAU gene   5,298   5,369     72   reverse
## 6     ycf33 gene   5,546   5,740    195   forward
## 7  trnY-GUA gene   7,698   7,780     83   reverse
## 8  trnV-UAC gene   8,306   8,371     66   forward
## 9  trnR-UCU gene   8,383   8,455     73   forward
## 10     trnT(ugu)   8,768   8,839     72   reverse
## ..           ...     ...     ...    ...       ...
```

*********
**Table 4: Chaetoceros simplex**

```r
source("../01 Data/chaetoceros.R", echo = TRUE)
```

```
## 
## > chaeto <- data.frame(fromJSON(getURL(URLencode("129.152.144.84:5001/rest/native/?query=\"select * from chaetoceros\""), 
## +     httpheader = c(DB = " ..." ... [TRUNCATED] 
## 
## > chaeto %>% tbl_df
## Source: local data frame [169 x 5]
## 
##              NAME MINIMUM MAXIMUM LENGTH DIRECTION
## 1      ycf45 gene       2   1,168  1,167   reverse
## 2       petD gene   1,330   1,812    483   reverse
## 3       petB gene   1,865   2,512    648   reverse
## 4   trnS-UGA gene   2,571   2,657     87   reverse
## 5       psaD gene   2,690   3,109    420   reverse
## 6  trnfM-CAU gene   3,195   3,266     72   reverse
## 7       rps2 gene   3,388   4,071    684   reverse
## 8      rpoC2 gene   4,159   8,406  4,248   reverse
## 9      rpoC1 gene   8,435  10,840  2,406   reverse
## 10      rpoB gene  10,858  15,099  4,242   reverse
## ..            ...     ...     ...    ...       ...
```
