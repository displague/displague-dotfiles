if command -v hss > /dev/null; then
    alias pcs='scp -S hss'
    alias ptfs='sftp -S hss'
    alias cnysr='rsync -e hss'
fi

