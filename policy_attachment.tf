resource "aws_iam_policy_attachment" "detach_policy" {
  name       = "detach-policy"
  roles      = [aws_iam_role.role.name]
  policy_arn = aws_iam_policy.policy.arn
}
