locals {
  sep_instance_name = "${lower(join("-", list(
        var.region,
        var.environment,
        "sep-manager"
    )))}"

  sep_sg_egress_name = "${lower(join("-", list(    
    var.region,
    var.environment,
    "egress",
    "sep-manager",
    "sg"
  )))}"

    sep_sg_ingress_name = "${lower(join("-", list(    
    var.region,
    var.environment,
    "ingress",
    "sep-manager",
    "sg"
  )))}"
}