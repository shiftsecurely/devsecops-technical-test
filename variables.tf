variable "name_prefix" {
  type        = string
  default     = "devsecops-test"
}

variable "region" {
  type        = string
  default     = "af-south-1"
}

variable "vpc_cidr" {
  type        = string
  default     = "10.20.0.0/16"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  default     = ["10.20.0.0/24"]
}

variable "private_subnet_cidrs" {
  type        = list(string)
  default     = ["10.20.10.0/24", "10.20.11.0/24"]
}

variable "lambda_memory_mb" {
  type    = number
  default = 256
}

variable "lambda_timeout_sec" {
  type    = number
  default = 10
}

variable "lambda_environment" {
  type    = map(string)
  default = { APP_NAME = "hello-api" }
}

variable "api_log_retention_days" {
  type    = number
  default = 14
}

variable "waf_rate_limit" {
  type    = number
  default = 2000
}
