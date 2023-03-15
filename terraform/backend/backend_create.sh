#! /bin/env bash

BACKEND_S3_BUCKET='terraform {\n
  backend "s3" {\n
    bucket = "dos11-student-diplom-project-backend"\n
    key    = "s3_bucket/terraform.tfstate"\n
    region = "us-west-1"\n
  }\n
}'

# First Initializing
terraform init
terraform apply -auto-approve
echo "Reinitializing..."
echo -e $BACKEND_S3_BUCKET > backend.tf
terraform fmt
# Copy state to S3 bucket state
terraform init -force-copy
echo "Finished initialize"
