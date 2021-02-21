## misc aliases

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias psl='ps f -eopid,user,etime,args'
alias pslw='ps f -wwweopid,user,etime,args'

alias scr='screen -D -R'
alias tem='emacs -nw'
alias mroe=more

alias give='find . -type d -exec chmod a+rx {} \; ; find . -type f -exec chmod a+r {} \; '

alias geturi='while read uri; do f=`basename ${uri:?Invalid uri}` && [ ! -e "$f" ] && curl -s $uri > $f && echo $uri > $f.URI && echo success: $f || echo "failure: $f"; done'

## tkooda : 2015-03-23 : allow args
##alias gotmp='cd $( mktemp -d /tmp/gotmp.`date +%m%d%H%M`.XXXXXX )'
function gotmp() { cd $( mktemp -d /tmp/gotmp.`date +%m%d%H%M`.`echo ${@// /_} |tr ' ' _`.XXXXXX; ); } ;
alias golast='for i in /tmp/gotmp.*; do [ -d "$i" ] && [ "`stat --format='%U' $i`" == "`whoami`" ] && last=$i; done; if [ -n "$last" ]; then echo $last; cd $last; fi'

alias lynx='lynx -accept_all_cookies'

alias df='df -hT'

alias tolower="tr '[A-Z]' '[a-z]'"
alias toupper="tr '[a-z]' '[A-Z]'"
alias random-line="perl -e 'print [<>]->[int rand $.]'"

alias bc='bc -ql'

alias smv='rsync --remove-source-files --partial -ai'

alias si="svn ci -m ''"

alias gc='git commit -a --allow-empty-message -m ""'
alias gp='git push'
alias gcp='git commit -a --allow-empty-message -m "" && git push'
alias gits='git status'

function mkdcd { x="`date -I`.${1// /_}"; mkdir "${x}" && cd "${x}" && pwd; }

function urlencode { python -c "import urllib; print urllib.quote('''$1''',safe='')"; }

function cdf() { cd "${1%/*}"; pwd; } # cd to parent of file


## 2017-04-17 : tkooda : transfer.sh (public) : upload file to public server to get URL to send someone
transfer() { if [ $# -eq 0 ]; then echo -e "No arguments specified. Usage:\n  transfer /tmp/test.txt"; return 1; else basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile"; fi; }


## 2018-08-19 : tkooda : generate a decent human-readable random password
alias decentpassword='r=$(cat /dev/urandom |tr -dc abcdefghknopqrstuvwxyzCDEY379 |head -c12); echo ${r:0:4}-${r:4:4}-${r:8:4}'

