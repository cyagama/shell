for x in "$@"
do
    if [ -d "$x" ]; then
        cd "$x"
        echo "$x"

        git fetch --prune
        git branch --format "%(refname:short) %(upstream:track)" | grep "\[gone\]" | awk '{print $1}' | xargs -IXXX git branch -D XXX
        git checkout .
        git clean -df
        git pull
        git gc --auto
    fi
done
