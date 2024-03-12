module "ssh-anywhere" {
  source = "github.com/gerardvm/terraform-aws-ssh-anywhere?ref=1.0.0"

  subnet_id                  = "subnet-1234567890abcdefg"
  instance_security_group_id = "sg-1234567890abcdefg"
  connection_ports           = [ 22, 3389 ] # Optional. Just these two ports are accepted. Default is 22
}