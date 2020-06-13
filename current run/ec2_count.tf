resource "aws_instance" "sep_instance" {
  # ami                     = "${data.aws_ami.windows.id}"
  ami                     = "${var.ami_id}"
  instance_type           = "${var.instance_type}"
  key_name                = "${var.ec2_keypair_name}"
  security_groups         = ["${aws_security_group.sep_sg_ingress.id}","${aws_security_group.sep_sg_egress.id}"]
  count                   = "${var.res_count}"
  # iam_instance_profile    = "${aws_iam_instance_profile.profile.name}"
  disable_api_termination = false
  monitoring              = true
  subnet_id               = "${element(var.subnet_id, count.index)}"
  root_block_device {
    volume_size = 30
    volume_type = "gp2"
    delete_on_termination = "${var.delete_on_termination}"
  }

  tags = {
    Name                = "${local.sep_instance_name}-${count.index}"
    CostCenter          = "${var.costcenter}"
    DataConfidentiality = "${var.dataconfidentiality}"
    Environment         = "${var.environment}"
    TeamCode            = "${var.teamcode}"
    BuiltBy             = "${var.builtby}"
    TeamEmailAddress    = "${var.teamemailaddress}"
  }

  # provisioner "local-exec" {
  #   command = "echo ${aws_instance.sep_instance.private_ip, count.index} >> ip_addressess.txt"  # this will output all the server IP addresses as they created in the file
  # }

  # user_data = "${data.template_file.bash_script.rendered}"  #.rendered when template is built by data, other normal file() doesn't need .renefered just file path
  
}



# resource "aws_ebs_volume" "sep_additional_vol" {
#   count      = "${var.res_count}"
#   size       = 20
#   type       = "gp2"
#   availability_zone = "${element(var.availability_zones, count.index)}"

#   tags = {
#     Name = "sep_additional_vol"
#     teamcode   = "${var.teamcode}"
#     CostCenter = "${var.costcenter}"
#   }
# }  

# resource "aws_volume_attachment" "ebs_attachment" {
#   device_name = "/dev/xvdb"
#   count       = "${var.res_count}"
#   volume_id   = "${element(aws_ebs_volume.sep_additional_vol.*.id, count.index)}"
#   instance_id = "${element(aws_instance.sep_instance.*.id, count.index)}"
# }

# resource "aws_iam_instance_profile" "profile" {
#   name = "test_profile"
#   role = "AmazonSSMRoleForInstancesQuickSetup"
# }


###################################################
## with lookup 
###################################################

# resource "aws_instance" "sep_instance" {
#   ami                     = "${lookup(var.ami_regions, var.region)}" # this will lookup the key from the map of ami_regions and return the value of the mathcing key
#   instance_type           = "${var.instance_type}"
#   key_name                = "${var.ec2_keypair_name}"
#   security_groups         = ["${aws_security_group.sep_sg_ingress.id}","${aws_security_group.sep_sg_egress.id}"]
#   count                   = "${var.res_count}"
#   iam_instance_profile    = "${aws_iam_instance_profile.profile.name}"
#   disable_api_termination = false
#   monitoring              = true
#   subnet_id               = "${element(var.subnet_id, count.index)}"
#   root_block_device {
#     volume_size = 150
#     volume_type = "gp2"
#     delete_on_termination = "${var.delete_on_termination}"
#   }

#   tags = {
#     Name                = "${local.sep_instance_name}-${count.index}"
#     CostCenter          = "${var.costcenter}"
#     DataConfidentiality = "${var.dataconfidentiality}"
#     Environment         = "${var.environment}"
#     TeamCode            = "${var.teamcode}"
#     BuiltBy             = "${var.builtby}"
#     TeamEmailAddress    = "${var.teamemailaddress}"
#     Company             = "${var.company}"
#   }
  
# }