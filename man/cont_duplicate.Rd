% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/continue duplicate number chang the text.R
\name{cont_duplicate}
\alias{cont_duplicate}
\title{continus duplicate change of text}
\usage{
cont_duplicate(b, colnum, input, text, t = NULL, j = 0)
}
\arguments{
\item{b}{is matrix form data.}

\item{input}{is change text.}

\item{text}{is select duplicate text}
}
\value{
overlab of plot
}
\description{
continus duplicate change of text
}
\examples{
b<-NULL
for(i in 1:5){
  (a<-sample(c(0,100),10,replace=T))
    b<-rbind(b,a)}

        cont_duplicate(b,3,NA,text=0)
}
