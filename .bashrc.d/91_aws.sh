COMPLETER=$(which aws_completer)
[ -n "$COMPLETER" ] && complete -C $(which aws_completer) aws

which eksctl > /dev/null && source <(eksctl completion bash)
