# terraform {
#   backend "s3" {
#     bucket       = "euw1-dev-csosecuritydev-inspector"
#     region       = "eu-west-1"
#     encrypt      = "true"
#     acl          = "private"
#     key          = "terraform/sep/sepm.tfstate"
#     kms_key_id   = "arn:aws:kms:eu-west-1:782747290936:key/51293562-b817-487f-9e31-a537273d525c"
#   }
# }

terraform {
  backend "local" {
    path = "ansible_run_terraform.tfstate"
  }
}