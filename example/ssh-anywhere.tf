module "ssh-anywhere" {
  source = "github.com/terraform-aws-modules/terraform-aws-ssh-anywhere?ref=0.0.1"

  instance_id                = "i-1234567890abcdef0"
  instance_security_group_id = "sg-1234567890abcdef0"
}