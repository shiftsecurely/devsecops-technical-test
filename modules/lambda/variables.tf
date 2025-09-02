variable "name_prefix" { type = string }
variable "vpc_id" { type = string }
variable "private_subnet_ids" { type = list(string) }
variable "lambda_memory_mb" { type = number }
variable "lambda_timeout_sec" { type = number }
variable "environment_vars" { type = map(string) }
