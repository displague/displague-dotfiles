alias k=kubectl
source <(kubectl completion bash)

which kind > /dev/null && source <(kind completion bash)
