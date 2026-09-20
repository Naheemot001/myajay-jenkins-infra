variable "region" {
  type        = string
  description = "aws region"
  default     = "ca-central-1"
}

variable "controller_instance_type" {
  type        = string
  description = "instance type"
  default     = "t3.medium"
}

variable "ami_id" {
  type        = string
  description = "ami"
  default     = "ami-06445ac85e0d277a9"
}

variable "vpc_id" {
  type        = string
  description = "vpc"
  default     = "vpc-084a10f473fb0a8bb"
}

variable "agent_instance_type" {
  type        = string
  description = "instance type"
  default     = "t3.large"
}

variable "key_name" {
  type        = string
  description = "key"
  default     = "Ajay_devs"
}

variable "subnets" {
  type        = list(string)
  description = "subnets"
  default     = ["subnet-094550475922cd8b7", "subnet-0a5ed46193c043c4c", "subnet-085fe175dbfb2e30f"]
}

variable "zone_id" {
  type        = string
  description = "zone id"
  default     = "Z017744921XM45LEYQ2D7"
}


variable "domain_name" {
  type        = string
  description = "domain"
  default     = "myajay.com"

}