output "lambda_arn" { value = aws_lambda_function.fn.arn }
output "lambda_invoke_arn" { value = aws_lambda_function.fn.invoke_arn }
output "role_arn" { value = aws_iam_role.lambda_exec.arn }
