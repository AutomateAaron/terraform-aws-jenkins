output "public_ip" {
  description = "The public ip address of the jenkins instance."
  value       = aws_eip.jenkins.public_ip
}

output "ssh_connect_command" {
  description = "The command to connect to the jenkins server over ssh."
  value       = "ssh -i ${var.ssh_key_name}.pem ubuntu@${aws_eip.jenkins.public_ip}"
}

output "url" {
  description = "The http endpoint to the jenkins server."
  value       = "${aws_eip.jenkins.public_ip}:${var.jenkins_port}"
}

output "next_steps" {
  description = "The next steps to configure your jenkins instance."
  value       = <<EOL
To complete jenkins setup:

Step 1, get the initialAdminPassword (Note: You may need to wait few minutes before initializion is comleted):

  ssh -i ${var.ssh_key_name}.pem ubuntu@${aws_eip.jenkins.public_ip} "sudo cat \$(sudo docker volume inspect jenkins-data --format '{{ .Mountpoint }}')/secrets/initialAdminPassword"

Step 2, using the initialAdminPassword, setup Jenkins at:

  http://${aws_eip.jenkins.public_ip}:${var.jenkins_port}/

EOL
}
