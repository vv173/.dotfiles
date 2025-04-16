# complete.sh

# GH CLI
eval "$(gh completion -s bash)"

# AWS CLI 2
complete -C '/usr/local/bin/aws_completer' aws

# kubectl
source <(kubectl completion bash)

# Helm
source <(helm completion bash)
