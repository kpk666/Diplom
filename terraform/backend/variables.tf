variable "tags" {
  type = map(any)
  default = {
    Project   = "diplom"
    Name      = "dos11-student"
    Terraform = true
  }
}

variable "bucket_name" {
  type    = string
  default = "dos11-student-diplom-project-backend"
}
