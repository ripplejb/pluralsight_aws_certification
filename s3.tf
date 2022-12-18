resource "aws_s3_bucket" "tb" {
  bucket = "testbucketforripal.xyz.231"

  tags = {
    name = "My Bucket"
    Env = "Dev"
  }

}