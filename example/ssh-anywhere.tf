module "ssh-anywhere" {
  source = "github.com/gerardvm/terraform-aws-ssh-anywhere?ref=0.1.0"

  instance_id                = "i-0cacfb3156dd98072"
  instance_security_group_id = "sg-0e1568c54d7cbad1b"
  connection_ports           = [ 22, 3389 ] # Optional. Just these two ports are accepted. Default is 22
}