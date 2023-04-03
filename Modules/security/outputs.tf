#/modules/securitY

output "ec2-sg" {
  value = aws_security_group.ec2-sg.id
}

output "alb-sg" {
  value = aws_security_group.alb-sg.id
}

output "ssh-sg" {
  value = aws_security_group.ssh-sg.id
}

output "rds-sg" {
  value = aws_security_group.rds-sg.id
}