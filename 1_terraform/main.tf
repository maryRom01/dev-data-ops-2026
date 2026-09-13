provider "aws" {
  region = "us-east-1"
}

# bucket - S3
resource "aws_s3_bucket" "training_bucket" {
  bucket = "dev-data-ops-bucket-2026-1"

  tags = {
    Environment = "Demo"
    ManagedBy   = "Terraform"
  }
}

# vm - EC2
resource "aws_instance" "training_vm" {
  ami           = "ami-0c101f26f147fa7fd"
  instance_type = "t3.micro"

  tags = {
    Name        = "dev-data-ops-VM-2026-1"
    Environment = "Demo"
  }
}

# dataset - RDS
resource "aws_db_instance" "training_db" {
  identifier        = "dev-data-ops-db"
  allocated_storage = 20
  storage_type      = "gp2"
  engine            = "postgres"
  engine_version    = "15"
  instance_class    = "db.t3.micro"
  db_name  = "trainingdb"
  username = "dbadmin"
  password = "password123!"

  skip_final_snapshot = true  

  tags = {
    Environment = "Demo"
    ManagedBy   = "Terraform"
  }
}

# outputs
output "created_bucket_name" {
  value = aws_s3_bucket.training_bucket.id
  description = "bucket"
}

output "created_vm_instance_id" {
  value = aws_instance.training_vm.id
}

output "created_db_endpoint" {
  value       = aws_db_instance.training_db.endpoint
  description = "endpoint for db"
}