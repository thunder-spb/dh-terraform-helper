#####################################
# https://github.com/wata727/tflint
#####################################

config {
  module     = false
  deep_check = false
  force      = false
}

##################
# Enforce styling
##################

rule "terraform_naming_convention" {
  enabled = true
}

rule "terraform_deprecated_interpolation" {
  enabled = true
}

rule "terraform_module_pinned_source" {
  enabled = true
  style = "semver"
}

rule "terraform_required_providers" {
  enabled = true
}

# Disable this rule by default, but enable inside scripts where relevant
rule "terraform_required_version" {
  enabled = false
}

rule "terraform_documented_outputs" {
  enabled = false
}

rule "terraform_documented_variables" {
  enabled = true
}

rule "terraform_comment_syntax" {
  enabled = true
}

rule "terraform_unused_declarations" {
  enabled = true
}

rule "terraform_standard_module_structure" {
  enabled = true
}

rule "terraform_deprecated_index" {
  enabled = true
}
