###################### AWS Account creds #######################

provider "aws" {
  shared_credentials_files = ["~/.aws/credentials"]
  profile = "default"
  region = "ap-south-1"

}