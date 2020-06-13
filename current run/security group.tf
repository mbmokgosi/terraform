resource "aws_security_group" "sep_sg_ingress" {
  name        = "${local.sep_sg_ingress_name}"
  description = "sep Security Group - created by terraform"
  vpc_id      = var.vpc_id

  ingress {
   from_port   = 22
   to_port     = 22
   protocol    = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
  }
  

  ingress {
    from_port   = 138
    to_port     = 138
    protocol    = "udp"
    cidr_blocks = "${module.constants.aws_prod_vpc_ips}"
  }

 ingress {
    from_port   = 137
    to_port     = 137
    protocol    = "udp"
    cidr_blocks = "${module.constants.aws_prod_vpc_ips}"
  }

   tags = {
    Name                = "${local.sep_sg_ingress_name}"
    CostCenter          = "${var.costcenter}"
    DataConfidentiality = "${var.dataconfidentiality}"
    Environment         = "${var.environment}"
    TeamCode            = "${var.teamcode}"
    BuiltBy             = "${var.builtby}"
    TeamEmailAddress    = "${var.teamemailaddress}"

  }
}

########################################################
#   EGRESS SG
########################################################

resource "aws_security_group" "sep_sg_egress" {
  name        = "${local.sep_sg_egress_name}"
  description = "sep Security Group - created by terraform"
  vpc_id      = var.vpc_id

  egress {
   from_port   = 443
   to_port     = 443
   protocol    = "tcp"
   cidr_blocks = ["192.0.0.0/8"]
  }

  egress {
    from_port   = 53
    to_port     = 53
    protocol    = "tcp"
    cidr_blocks = "${module.constants.aws_prod_vpc_ips}"
  }

  egress {
    from_port   = 53
    to_port     = 53
    protocol    = "udp"
    cidr_blocks = "${module.constants.aws_prod_vpc_ips}"
  }

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = "${module.constants.aws_prod_vpc_ips}"
  }
  


   tags = {
    Name                = "${local.sep_sg_egress_name}"
    CostCenter          = "${var.costcenter}"
    DataConfidentiality = "${var.dataconfidentiality}"
    Environment         = "${var.environment}"
    TeamCode            = "${var.teamcode}"
    BuiltBy             = "${var.builtby}"
    TeamEmailAddress    = "${var.teamemailaddress}"
  }
}