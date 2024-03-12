resource "aws_iam_policy" "policy" {
  name        = "policy"
  description = "An IAM policy"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = "ec2:DescribeInstances",
        Resource = "*"
      },
      {
        Effect   = "Allow",
        Action   = "ec2:StartInstances",
        Resource = "*"
      },
      {
        Effect   = "Allow",
        Action   = "ec2:StopInstances",
        Resource = "*"
      }
    ]
  })
}