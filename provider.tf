provider "volterra" {
  alias        = "default"
  api_p12_file = var.f5xc_api_p12_file
  api_cert     = var.f5xc_api_p12_file != "" ? "" : var.f5xc_api_cert
  api_key      = var.f5xc_api_p12_file != "" ? "" : var.f5xc_api_key
  api_ca_cert  = var.f5xc_api_ca_cert
  url          = var.f5xc_api_url
}

provider "aws" {
  region = "us-east-1"
  alias  = "us-east-1"
}
