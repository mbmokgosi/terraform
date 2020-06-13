# provider "aws" {
#   region  = "${var.region}"
#   assume_role {
#     role_arn = var.aws_assume_role_arn
#   }
# }

###############################################
# Using saml profile
###############################################

# provider "aws" {
#   region  = "${var.region}"
#   profile = "adfs_csosecuritydev"
# }

################################################
## using user creds
################################################

provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAVCPXFRM4BOZOX3MC"
  secret_key = "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"
}