module "ssh-anywhere" {
  source = "github.com/gerardvm/terraform-aws-ssh-anywhere?ref=0.1.0"

  instance_id                = "i-1234567890abcdef0"
  instance_security_group_id = "sg-1234567890abcdef0"
}