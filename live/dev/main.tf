resource "aws_instance" "webserver" {
  ami                    = "ami-04505e74c0741db8d" # Ubuntu AMI
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.webserver.id]
  user_data              = <<-EOF
                          #!/bin/bash
                          echo "Hello, World" > index.html
                          nohup busybox httpd -f -p ${var.webserver_port} &
                          EOF
  tags = {
    Name       = "Webserver"
    Automation = "Terraform"
  }
}

resource "aws_security_group" "webserver" {
  name = "sg_webserver"
  ingress {
    from_port   = var.webserver_port
    to_port     = var.webserver_port
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTP Anywere"
    protocol    = "tcp"
  }
}