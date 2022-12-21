# This is collection of random terraform scripts I created while preparing for AWS certification.

1. In **ec2.tf** file, make sure to change the code below and add path to your rsa public key.

```terraform
resource "aws_key_pair" "ssh-key" {
  key_name = "ssh-key"
  public_key = file("~/.ssh/id_rsa.pub")
}
```
