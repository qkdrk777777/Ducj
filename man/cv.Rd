% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Cross Validation.R
\name{cv}
\alias{cv}
\title{Cross Validation}
\usage{
cv(data, test = 0.3, train = 0.7, valid = 0, print = F)
}
\description{
Cross Validation
}
\examples{
data<-cv(iris,0.2,0.8,print=TRUE)
a<-NULL
for(i in 1:length(data))
a[i]<-nrow(data[[i]])
}
