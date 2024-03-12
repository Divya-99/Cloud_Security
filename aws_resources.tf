resource "aws_instance" "lab6" {
  ami           = "ami-0f403e3180720dd7e"
  instance_type = "t2.micro"

  tags = {
    Name        = "Lab6"
    Environment = "Production"
    Owner       = "Divya Alex"
  }
  iam_instance_profile = aws_iam_instance_profile.example_profile.name
}

resource "aws_iam_instance_profile" "example_profile" {
  name = "example_profile"
  role = aws_iam_role.example_role.name
}


 