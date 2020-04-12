alias rr='script ~/record-terminal/output-`date +%F_%X`.txt'
alias ll='ls -la'
alias you='mpsyt'
alias goog='lynx_google_query_function'
alias dod='lynx_google_query_function'
alias dood='lynx_google_query_function'
lynx_google_query_function() {
  # raw_google_query - слова запроса из командной строки, переданные в сюда, как аргумент. Пример: goog 'как установить линукс на комп'
  raw_google_query=$1;
  space_substituted_query=${raw_google_query// /+};
  echo Query: $space_substituted_query
  lynx https://www.google.com/search?q=$space_substituted_query;
}
