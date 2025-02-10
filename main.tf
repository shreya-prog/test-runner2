# Declare variables
variable "aws_region" {
  description = "AWS region for deployment"
  type        = string
}

variable "function_name" {
  description = "Name of the Lambda function"
  type        = string
}


provider "aws" {
  region = var.aws_region
}

resource "aws_lambda_function" "lambda_function" {
  function_name = var.function_name
  handler       = "index.handler"
  runtime       = "python3.9"
  filename      = "lambda.zip"

  role = aws_iam_role.lambda_role.arn
}

resource "aws_iam_role" "lambda_role" {
  name               = "lambda-execution-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}


