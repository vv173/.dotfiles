# functions.sh

# Run yq in docker container
yq() {
  docker run --rm -i -w /workdir -v "${PWD}":/workdir mikefarah/yq "$@"
}

# Run jq in docker container
jq() {
  docker run --rm -i -w /workdir -v "${PWD}":/workdir ghcr.io/jqlang/jq "$@"
}

# Run hadolint in docker container
hadolint() {
  docker run --rm -i hadolint/hadolint hadolint "$@" 
}

# Run shellcheck in docker container
shellcheck() {
  docker run --rm -i -w /mnt -v "${PWD}:/mnt" koalaman/shellcheck:stable "$@"
}

# Run kustomize in docker container
kustomize() {
  docker run --rm -i -w /workdir -v "${PWD}:/workdir" registry.k8s.io/kustomize/kustomize:v5.6.0 "$@"
}

# Run terraform in docker container
# terraform() {
#   docker run --rm -i -w /workdir -v "${PWD}:/workdir" hashicorp/terraform:latest "$@"
# }

# Run terraform with shared docker socket in docker container
# terraform-docker() {
#   docker run --rm -i -v /var/run/docker.sock:/var/run/docker.sock -w /workdir -v "${PWD}:/workdir" hashicorp/terraform:latest "$@"
# }

# Run aws-cli2 in docker container
# aws() {
#   docker run --rm -it -e AWS_PROFILE -v ~/.aws:/root/.aws -v $(pwd):/aws amazon/aws-cli:latest "$@"
# }