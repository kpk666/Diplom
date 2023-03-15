terraform {
  backend "s3" {
    bucket = "dos11-student-diplom-project-backend"
    key    = "s3_bucket/terraform.tfstate"
    region = "us-west-1"
  }
}
