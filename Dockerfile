FROM alpine:3.12

# Available versions: https://github.com/hashicorp/terraform/releases
ARG TOOL_TF_VERSION=0.14.4
# Available versions: https://github.com/terraform-linters/tflint/releases
ARG TOOL_TFLINT_VERSION=0.20.3
# Available versions: https://github.com/terraform-docs/terraform-docs/releases
ARG TOOL_TFDOCS_VERSION=0.10.1
# Available versions: https://releases.hashicorp.com/vault/
ARG TOOL_VAULT_VERSION=1.6.0

RUN apk add --no-cache wget unzip findutils bash jq \
  && rm -rf /var/cache/apk/* \
  && mkdir /work

WORKDIR /work

RUN wget -nv -O /tmp/tf.zip https://releases.hashicorp.com/terraform/${TOOL_TF_VERSION}/terraform_${TOOL_TF_VERSION}_linux_amd64.zip \
  && unzip /tmp/tf.zip -d /usr/bin \
  && rm -vf /tmp/tf.zip \
  && chmod 755 /usr/bin/terraform \
  && mkdir -p /root/.terraform.d/plugins \
  && terraform -v

RUN cd /usr/bin \
  && wget -nv -O /tmp/tflint.zip https://github.com/terraform-linters/tflint/releases/download/v${TOOL_TFLINT_VERSION}/tflint_linux_amd64.zip \
  && unzip /tmp/tflint.zip -d /usr/bin \
  && rm -vf /tmp/tflint.zip \
  && chmod 755 /usr/bin/tflint \
  && tflint -v

RUN wget -nv -O /usr/bin/terraform-docs https://github.com/terraform-docs/terraform-docs/releases/download/v${TOOL_TFDOCS_VERSION}/terraform-docs-v${TOOL_TFDOCS_VERSION}-linux-amd64 \
  && chmod 755 /usr/bin/terraform-docs \
  && terraform-docs -v

RUN wget -nv -O /tmp/vault.zip https://releases.hashicorp.com/vault/${TOOL_VAULT_VERSION}/vault_${TOOL_VAULT_VERSION}_linux_amd64.zip \
  && unzip /tmp/vault.zip -d /usr/bin \
  && rm -vf /tmp/vault.zip \
  && chmod 755 /usr/bin/vault \
  && vault -v

COPY configs/.tflint.hcl /root/.tflint.hcl
COPY scripts/tflinter /usr/bin/tflinter
COPY configs/.terraform-docs.yml /root/.terraform-docs.yml

RUN chmod 755 /usr/bin/tflinter \
  && chmod 644 /root/.tflint.hcl

LABEL name="Terraform binary, Terraform Docs, Terraform Linter, Hashicorp Vault binary based on Alpine"
LABEL maintainer="Alexander thunder Shevchenko <iam@thunder.spb.ru>"
LABEL tools.terraform.version="${TOOL_TF_VERSION}"
LABEL tools.terraform-docs.version="${TOOL_TFDOCS_VERSION}"
LABEL tools.terraform-lint.version="${TOOL_TFLINT_VERSION}"
LABEL tools.vault.version="${TOOL_VAULT_VERSION}"

