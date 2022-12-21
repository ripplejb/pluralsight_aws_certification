data "aws_ami" "rhel9" {
  most_recent = true

  filter {
    name = "image-id"
    values = ["ami-08e637cea2f053dfa"]
  }

}

resource "aws_key_pair" "ssh-key" {
  key_name = "ssh-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "my-rhel9" {
  ami = "${data.aws_ami.rhel9.id}"
  instance_type = "t2.micro"
  key_name = "ssh-key"

  tags = {
    name = "Hello"
  }
}