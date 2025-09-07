include "root" { path = find_in_parent_folders("root.hcl") }

terraform {
  source = "tfr://registry.terraform.io/cloudposse/amplify-app/aws?version=1.2.0"
}

# Only generate versions; provider will read AWS_REGION from env
generate "versions" {
  path      = "versions.tf"
  if_exists = "overwrite"
  contents  = <<EOF
terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = { source = "hashicorp/aws", version = "~> 5.0" }
  }
}
EOF
}

include "inputs" { path = "${get_terragrunt_dir()}/inputs.hcl" }
