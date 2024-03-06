# Terraform AWS EC2 Instance Connect Endpoint

This module creates an EC2 Instance Connect endpoint in an AWS account so you just need to execute the following command to connect via SSH to an EC2 instance:

```bash
aws --region <your_aws_region> ec2-instance-connect ssh \
--instance-id <your_instance_id> \
--os-user ec2-user \
--local-forwarding <local_port>:<destination_host_ip>:<destination_host_port> \
--connection-type eice
```