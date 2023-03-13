variable "tags" {
  type = map(any)
  default = {
    Project   = "diplom"
    Name      = "dos11-student"
    Terraform = true
  }
}

variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

variable "aws_region_name" {
  type = string
  default = "us-east-2"
}

variable "aws_key_pair_name" {
  type = string
  default = "Astr-key"
}