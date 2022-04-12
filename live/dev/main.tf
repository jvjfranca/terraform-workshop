resource "aws_instance" "webserver" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.webserver.id]
  user_data     = <<-EOF
  #!/bin/bash
  echo ""Hello, World" > index.html
  nohup busybox httpd -f -p 8080 &
  EOF
  tags = {
    Name       = "Webserver"
    Automation = "Terraform"
  }
}

resource "aws_security_group" "webserver" {
  name = "sg-webserver"
  ingress = [ {
    from_port = 80
    to_port = 80
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "Allow HTTP Anywere"
    protocol = "tcp"
  } ]
}