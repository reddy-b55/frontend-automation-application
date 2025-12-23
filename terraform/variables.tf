variable "key_name" {
  default = "devops-key"
}
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "ami_id" {
  default = "ami-0030e4319cbf4dbf2"
}

