## local user/host git bin paths

for basedir in \
  /usr/local/git/config-public \
  /usr/local/git/config-private \
  ~/tmp/git/bbgit2/config-public \
  ~/tmp/git/bbgit2/config-private \
  ; do

  for subdir in \
    host/0 \
    host/`hostname` \
    host/`hostname -a` \
    user/0 \
    user/${USER} \
    ; do

    for d in ${basedir}/${subdir}/bin ; do
      [ -d "$d" ] || continue
      export PATH="${d}:${PATH}"
    done

  done

done

