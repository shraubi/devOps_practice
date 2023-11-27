output "sg_ping_id" {
  value = aws_security_group.sg_ping.id
}

output "my_security_group" {
  value = aws_security_group.my_security_group.id
}

output "my_vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}