terraform {
  backend "s3" {
    bucket = "dos11-student-diplom-project-backend"
    key    = "structure/terraform.tfstate"
    region = "us-west-1"
  }
}
