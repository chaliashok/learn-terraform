resource "aws_s3_bucket" "example" {
  bucket = "terraform-chakri"
 # key = "params/terraform.tfstate"
  region = "us-east-1"
  }



output "example" {
  value = "hellow world"
}