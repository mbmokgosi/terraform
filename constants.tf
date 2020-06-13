output "aws_prod_vpc_ips" {
  description = "CIDR ranges of eu-west-1 region production vpcs"
  value = [
    "172.31.32.0/20",     # prod
    "172.31.16.0/20",     # prod
    "172.31.80.0/20",     # prod
    "172.31.0.0/20",     # prod ife
    "172.31.48.0/20",  # euw1-prd-ss-vpc
    "172.31.64.0/20",  # euw1-prd-tvpc-vpc
  ]
}
