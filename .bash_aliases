alias goog='lynx_google_query_function'
lynx_google_query_function() {
  lynx https://www.google.com/search?q=$1;
}
