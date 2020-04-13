output "public_ip" {
  value = aws_eip.jenkins.public_ip
}

output "ssh_connect_command" {
  value = "ssh -i ${var.ssh_key_name}.pem ubuntu@${aws_eip.jenkins.public_ip}"
}

output "url" {
  value = "${aws_eip.jenkins.public_ip}:${var.jenkins_port}"
}

output "next_steps" {
  value = <<EOL

Step 1, get the initialAdminPassword:

  ssh -i ${var.ssh_key_name}.pem ubuntu@${aws_eip.jenkins.public_ip} "sudo cat \$(sudo docker volume inspect jenkins-data --format '{{ .Mountpoint }}')/secrets/initialAdminPassword"

Step 2, using the initialAdminPassword, setup Jenkins at:

  http://${aws_eip.jenkins.public_ip}:${var.jenkins_port}/

EOL
}
