#' translate shiny open
#'
#' @param non parameters.
#' @examples
#' tran()
#' tran(sleep=2)
#' @export
tran<-function(sleep=1){
  library(shiny)
  library(stringr)
  library(RCurl)
  library(RSelenium)
  library(XML)
  library(rvest)
  ui<-fluidPage(title='lotto sample',
                textAreaInput('text','Please enter a word to translate.'),
                verbatimTextOutput('txt'))
  server<-function(input,output,session){

    output$txt<-renderPrint({
      req(input$text)
      data<-input$text
      t=4567L

      pJS=NA
      while(is.na(pJS)){
        t=as.integer(t+1)
      pJS <- wdman::phantomjs(port = t)
      }

      koen=T
      if(length(unlist(str_extract_all(data,'\\p{Hangul}+')))==0)koen=F
      remDr <- remoteDriver(port=t, browserName = 'chrome')
      remDr$open()

      if(koen==T)remDr$navigate(paste0('https://translate.google.co.kr/?hl=#ko/en/'))else remDr$navigate(paste0('https://translate.google.co.kr/?hl=#en/ko/'))
      #remDr$screenshot(display = T)
      tr<-remDr$findElement(using='css',value='textarea#source')
      tr$sendKeysToElement(list(paste(data)))
      Sys.sleep(sleep)
      source<-remDr$getPageSource()[[1]]
      a<-read_html(source)%>%html_nodes(css='.short_text#result_box')%>%html_text()
      a<-paste(a,collapse='')
      remDr$goBack()

      remDr$close()
      pJS$stop()
      a

    })
  }

  shinyApp(ui,server)
}
#tran()
