#AWS Key Pair

resource "aws_key_pair" "aws_key" {
  key_name   = "aws_key"
  public_key = file("~/.ssh/id_rsa.pub")
}
#AWS resource for server creation
resource "aws_instance" "webserver" {
  ami                         = "ami-06d79c60d7454e2af"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.aws_key.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [ aws_security_group.allow_ssh_http.id ]
  subnet_id                   = "subnet-0b2ac0096b48cd624"

  depends_on = [
    aws_key_pair.aws_key,
    aws_security_group.allow_ssh_http
  ]

  tags = {
    Name        = "Web Server"
    Terraform   = "true"
    Environment = "dev"
  }
}
# create security group to allow ssh and http connection from the internet

resource "aws_security_group" "allow_ssh_http" {
  description = "Allow SSH and HTTP inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow HTTP (80) from the internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH from the internet"
    from_port   = 22
    to_port     = 22
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
    Name = "Sgroup-Webserver"
  }
}
