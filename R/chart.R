#' Chart INEGI series
#'
#' Charts one or more INEGI series using inegiR package.
#'
#' @param hc highcharter object
#' @param series one or more INEGI series to chart. All will obey same type of chart. Must be same length and frequency.
#' @param token INEGI API token
#' @param type type of chart, to pass to highcharter
#' @param names if NULL will use metadata to name series, but can be overwriten with this parameter 
#' @param decimals number of decimals to show in tooltip
#'
#' # @importFrom inegiR compact_inegi_series
#' @importFrom highcharter hc_add_series
#' @importFrom highcharter hc_xAxis
#' @examples
#' \dontrun{
#' library(higcharter)
#' library(inegiR)
#' highchart() %>% hc_inegi(c(s1, s2), token)
#' }
#' @export
hc_inegi <- function(hc, series, token, 
                     type = "line", 
                     names = NULL) {
  # download --
  n <- length(series)
  df <- NULL
  for(i in 1:n){
    # !!!!! inegiR::compact
    tmp <- compact_inegi_series(series = series[i], token = token)
    tmp$ChartSerie <- as.character(series[i])
    df <- rbind.data.frame(df, tmp)
  }
  
  # options --
    # names 
  if(is.null(names)){
    s_names <- c(unique(df$Name))}else{s_names <- names}
  if(length(s_names)==length(series)){}else{stop("There must be a name per series, or equal to NULL")}
  
  # check the frequencies 
  if(!chk_inegi_freq(unique(df$Frequency))){
    stop("Different frequency series are not supported... yet")}
  
  # make chart --
  for(i in 1:n){
    dat <- df[df$ChartSerie == series[i],]
    hc <- hc_add_series(hc = hc, 
                        data = dat$Values, 
                        name = s_names[i], type = type) 
  }
  
  hc <- hc_xAxis(hc, categories = unique(df$Dates))
return(hc)
}
#' Checks series for frequency
#'
#' Compares all INEGI series in frequency, to force only same series. Might be less useful later on.
#' 
#' @param frequencies
#' @export
chk_inegi_freq <- function(frequencies){
  if (length(frequencies)==1L){
    return(TRUE)
  }else{
    if(length(frequencies)==0L){
      return(TRUE)
    }else{
      v <- vapply(1:(length(frequencies)-1),
                  function(n) identical(frequencies[[n]], frequencies[[n+1]]),
                  logical(1))
      if(all(v)){return(TRUE)}else{
        return(FALSE)
      }
    }
  }
}