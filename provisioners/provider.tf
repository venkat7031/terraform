terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "5.98.0"
      }
    
}

backend "s3" {
    bucket       = "uppalavenky-84s-remote-state"
    key          = "provisioners"
    use_lockfile = true
    encrypt = true
    region       = "us-east-1"
  }
}


provider "aws" {
  
}
