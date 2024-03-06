module "ssh-anywhere" {
  source = "github.com/gerardvm/terraform-aws-ssh-anywhere?ref=0.2.0"

  instance_id                = "i-1234567890abcdef0"
  instance_security_group_id = "sg-1234567890abcdef0"
  connection_ports           = [ 22, 3389 ] # Optional. Just these two ports are accepted. Default is 22
}