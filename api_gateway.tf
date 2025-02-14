resource "aws_api_gateway_rest_api" "app_api" {
  name        = "serverless-app-api"
  description = "API Gateway for the serverless app"
}

resource "aws_api_gateway_resource" "app_resource" {
  rest_api_id = aws_api_gateway_rest_api.app_api.id
  parent_id   = aws_api_gateway_rest_api.app_api.root_resource_id
  path_part   = "items"
}

resource "aws_api_gateway_method" "app_method" {
  rest_api_id   = aws_api_gateway_rest_api.app_api.id
  resource_id   = aws_api_gateway_resource.app_resource.id
  http_method   = "ANY"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "lambda_integration" {
  rest_api_id             = aws_api_gateway_rest_api.app_api.id
  resource_id             = aws_api_gateway_resource.app_resource.id
  http_method             = aws_api_gateway_method.app_method.http_method
  type                    = "AWS_PROXY"
  integration_http_method = "POST"
  uri                     = aws_lambda_function.app_lambda.invoke_arn
}

resource "aws_lambda_permission" "api_gateway_permission" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.app_lambda.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.app_api.execution_arn}/*/*"
} 

resource "aws_api_gateway_deployment" "my_deployment" {
  depends_on = [
    aws_api_gateway_integration.lambda_integration
  ]

  rest_api_id = aws_api_gateway_rest_api.app_api.id
  stage_name  = "prod"
}