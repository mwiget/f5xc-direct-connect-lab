module "aws-site-1" {
  source                          = "./modules/f5xc/site/aws/vpc"
  f5xc_api_url                    = var.f5xc_api_url
  f5xc_api_token                  = var.f5xc_api_token
  f5xc_namespace                  = "system"
  f5xc_tenant                     = var.f5xc_tenant
  f5xc_aws_region                 = "us-east-1"
  f5xc_aws_cred                   = "mw-aws-personal"
  #f5xc_aws_cred                   = "mw-aws-f5"
  f5xc_aws_vpc_site_name          = format("%s-aws-site-1", var.project_prefix)
  f5xc_aws_vpc_name_tag           = format("%s-aws-site-1", var.project_prefix)
  f5xc_aws_vpc_primary_ipv4       = "192.168.168.0/21"
  f5xc_aws_vpc_total_worker_nodes = 0
  f5xc_aws_ce_gw_type             = "multi_nic"
  f5xc_aws_vpc_az_nodes           = {
    node0 = {
      f5xc_aws_vpc_workload_subnet = "192.168.168.0/26", f5xc_aws_vpc_inside_subnet = "192.168.168.64/26",
      f5xc_aws_vpc_outside_subnet  = "192.168.168.128/26", f5xc_aws_vpc_az_name = "us-east-1a"
    }
  }
  f5xc_aws_default_ce_os_version       = true
  f5xc_aws_default_ce_sw_version       = true
  f5xc_aws_vpc_no_worker_nodes         = true
  f5xc_aws_vpc_use_http_https_port     = true
  f5xc_aws_vpc_use_http_https_port_sli = true

  f5xc_aws_vpc_direct_connect_hosted_vifs = [ var.hosted_vif ]
  f5xc_aws_vpc_direct_connect_disabled      = false
  f5xc_aws_vpc_direct_connect_manual_gw     = false
  f5xc_aws_vpc_direct_connect_standard_vifs = false
  f5xc_aws_vpc_direct_connect_custom_asn    = 64555
  public_ssh_key                            = var.ssh_public_key
  f5xc_labels                               = { "virtualSite" = "marcel-vsite" }

  providers = {
    aws = aws.us-east-1
  }
}

output "aws-site-1" {
  value = module.aws-site-1
}
