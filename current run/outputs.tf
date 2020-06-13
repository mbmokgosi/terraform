#Outputs
output "instance_id" {  
  value = {
    for instance in aws_instance.sep_instance:
      instance.id => instance.private_ip
  }
}

