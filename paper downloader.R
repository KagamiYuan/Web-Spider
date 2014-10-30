setwd("/Users/yuanyuan/快盘/R/Web Spider")


library(XML)
for(i in 14000000:15000000){
        paper.url <- paste("http://www.unitalenlaw.com/html/unitalenlaw/report/",i,"-1.htm",sep="")
        paper.html <- htmlTreeParse(paper.url, useInternalNodes=T)#读取html
        article <- xpathSApply(paper.html, "//p", xmlValue)#读取<p></p>之间的内容
        title <- xpathSApply(paper.html,"//title", xmlValue)#读取title
        article[1] <- title
        write(article, file=paste(i,"-",title, ".txt", sep=""), sep=" ")#写成txt
}

url <- "http://www.unitalenlaw.com/html/unitalenlaw/category/46559-1.htm?&l6930=0"
doc <- htmlParse(url)
links <- xpathSApply(doc, "//a/@href")
free(doc)
links <- as.vector(links)
names <- xpathSApply(doc, "//a", xmlValue)
names <- as.vector(names)
comb <- data.frame(names, links)