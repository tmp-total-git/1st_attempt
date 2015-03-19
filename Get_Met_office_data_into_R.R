# GET MET OFFICE DATA FOR SCOTLAND AND THE UNITED KINGDOM

metimport<-function(area,type) {
  string<-paste("http://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/T",type,"/date/",area,".txt",sep="")
  data<-read.table(string,sep="", header=TRUE,skip=7,fill = TRUE,stringsAsFactors=FALSE)
  names(data)<-paste(area,type,names(data),sep=".")
  names(data)[1]<-"Year"
  return(data.frame(data[1:13]))
}
tmp1<-metimport('Scotland','min')
tmp2<-metimport('Scotland','mean')
tmp3<-metimport('UK','min')
tmp4<-metimport('UK','mean')
tmp5<-merge(tmp1,tmp2,by="Year")
tmp6<-merge(tmp3,tmp4,by="Year")
Met_office<-merge(tmp5,tmp6,by="Year")