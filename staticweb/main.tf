provider "aws" {
  region = "us-east-2"
}

module "s3" {
  source = "../modules/s3"

  bucket_name = "ev-sh-ab-1996"
}

output "website_endpoint" {
  value = module.s3.website_endpoint
}
