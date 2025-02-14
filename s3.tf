resource "aws_s3_bucket" "lambda_bucket" {
  bucket = "serverless-app-lambda-bucket"
  tags = {
    Name = "Lambda Deployment Bucket"
  }

  lifecycle {
    prevent_destroy = true
  }
}