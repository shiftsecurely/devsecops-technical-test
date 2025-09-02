output "vpc_id" { value = module.vpc.vpc_id }
output "private_subnet_ids" { value = module.vpc.private_subnet_ids }
output "public_subnet_ids" { value = module.vpc.public_subnet_ids }
output "lambda_role_arn" { value = module.lambda.role_arn }
output "api_invoke_url" { value = module.apigw.invoke_url }
# output "waf_web_acl_arn" { value = module.waf.web_acl_arn }
