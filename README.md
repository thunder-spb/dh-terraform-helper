# Docker container

Terraform binary, Terraform Docs, Terraform Linter, Hashicorp Vault binary based on Alpine

Versions:

- Alpine version: _3.12_
- Terraform binary (**terraform**) version: _0.14.4_, Home: https://github.com/hashicorp/terraform/
- Terraform linter (**tflint**) version: _0.20.3_, Home: https://github.com/terraform-linters/tflint/
- Terraform Docs (**terraform-docs**) version: _0.10.1_, Home: https://github.com/terraform-docs/terraform-docs/
- Hashicorp Vault (**vault**) version: _1.6.0_, Home: https://www.vaultproject.io/

# Additional scripts and configs

## tflint config

Config located at `/root/.tflint.hcl`

Additional helper script located at `/usr/bin/tflinter`. It will recurse all directories where `*.tf` files found from the current working directory. Original binary is at `/usr/bin/tflint`.

## terraform docs config

Config located at `/root/.terraform-docs.yml`. To use it, copy that config into working directory and run `terraform-docs`.

# Github home

https://github.com/thunder-spb/dh-terraform-helper

# Docker Hub home

Here is the link on Docker Hub: https://hub.docker.com/r/thunderspb/terraform-helper
