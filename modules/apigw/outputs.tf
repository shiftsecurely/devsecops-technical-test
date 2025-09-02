output "invoke_url" {
  value = aws_apigatewayv2_stage.prod.invoke_url
}

output "stage_arn" {
  value = aws_apigatewayv2_stage.prod.arn
}