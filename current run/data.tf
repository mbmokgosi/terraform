### Data sources allow you to get dynamic information from aws about some rseources there
### It allows you to use filters and other vaules to bring data back DATA from aws account
### below examples bring back ami based on the filter and route 53 hosted zone, so that a record can be added in the hosted zone

# data "aws_ami" "windows" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["windows-server-2016-unencrypted_*"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#   owners = ["864385758454"]
# }

# data "aws_route53_zone" "route53_zone_details" {
#   name         = var.route53_zone_name
#   private_zone = true
# }

# ### will return a list of used EC2 IPs ranges for regions for whitelisting in SGs
# data "aws_ip_ranges" "aws_internal_cidrs"{
#   regions = ["ee-west-1", "eu-cntral-1", "us-west-1"]
#   services = ["ec2"]
# }