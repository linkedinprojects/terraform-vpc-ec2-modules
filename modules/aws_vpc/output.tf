output "vpc_id" {
  value = aws_vpc.vpc_test.id
}

output "Pub_subnet_id" {
  value = aws_subnet.subnet_pub.id
}