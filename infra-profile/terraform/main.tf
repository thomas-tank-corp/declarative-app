terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.24"
    }
    random = {
      source = "hashicorp/random"
    }
  }

  required_version = ">= 1.0.0"
}

resource "random_pet" "name" {
  length = 3
}

provider "aws" {
  region     = "eu-west-2"
  access_key = var.access_key
  secret_key = var.secret_key
}


module "aws_s3" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "humanitec-${random_pet.name.id}"
  acl    = "private"
}


variable "credentials" {
  type = object({
    access_key = string
    secret_key = string
  })
}

output "region" {
  value = data.tfe_outputs.outputs.values.s3_bucket_region
}

output "bucket" {
  value = data.tfe_outputs.outputs.values.s3_bucket_bucket_domain_name
}

output "aws_access_key_id" {
  value     = var.credentials.access_key
  sensitive = true
}

output "aws_secret_access_key" {
  value     = var.credentials.secret_key
  sensitive = true
}