## local user/host git bin paths

for basedir in \
  /usr/local/git/ \
  ~/tmp/git/bbgit2 \
  ; do
  
  for repo in \
    config-public \
    config-private \
    bin-public \
    bin-private \
    ; do
    
    for subdir in \
      host/0 \
      host/`hostname` \
      host/`hostname -a` \
      user/0 \
      user/${USER} \
      ; do
      
      for d in ${basedir}/${repo}/${subdir}/bin ; do
        [ -d "$d" ] || continue
        export PATH="${d}:${PATH}"
      done
    
    done
  
  done

done

