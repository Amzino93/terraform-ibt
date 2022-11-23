output "subnet" {
  value = aws_subnet.ibt-subnet-1
}

output "security-group" {
  value = aws_default_security_group.ibt-security-group
}
