resource "aws_security_group" "eks_sec_group" {
  vpc_id = aws_vpc.eks_vpc.id
  name   = "eks-sec-group"

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "eks-sec-group"
  }
}

