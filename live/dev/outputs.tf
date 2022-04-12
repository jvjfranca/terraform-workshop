output "webserver_pub_ip" {
  value = aws_instance.webserver.public_ip
  description = "WebServer Public IP"
}

output "webserver_pub_dns" {
  value = aws_instance.webserver.public_dns
  description = "WebServer Public DNS"
}

output "webserver_sg_group" {
  value = aws_security_group.webserver.id
  description = "WebServer SG Group ID"
}