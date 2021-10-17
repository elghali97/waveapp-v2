// ----------- INSTANCE AMI -----------
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }

  owners = ["amazon"]
}

// ----------- POLICIES FOR SSM -----------
data "aws_iam_policy" "ssmcore" {
  arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

