locals {
  aws_region = get_env("AWS_REGION", "us-east-1")
  bucket     = get_env("TF_STATE_BUCKET")
  table      = get_env("TF_STATE_TABLE")
}

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
  config = {
    bucket         = local.bucket
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = local.aws_region
    dynamodb_table = local.table
    encrypt        = true
  }
}
