## git bin paths

for d in /usr/local/git/*/bin ; do
  [ -d "$d" ] || continue
  PATH="${d}:${PATH}"
done

