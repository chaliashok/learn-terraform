#output "instance_ips" {
#  value = aws_instance.web.*.public_ip
#}
#
#output "lb_address" {
#  value = aws_alb.web.public_dns
#}
#
#output "password" {
#  sensitive = true
#  value = var.secret_password
#}
output "system" {
  value="hello world"
}

output "system1" {
  value=1000
}