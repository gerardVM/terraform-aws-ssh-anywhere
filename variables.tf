variable subnet_id {
    type        = string
    description = "The subnet ID of the instance"
}

variable instance_security_group_id {
    type        = string
    description = "The security group ID of the instance"
}

variable connection_ports {
    type        = list(number)
    description = "The list of ports to allow in the security groups"
    default     = [22]
}