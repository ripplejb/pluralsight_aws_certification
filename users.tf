resource "aws_iam_user" "hsu" {

  name = "hello_s3_user"

  path = "/system/"

  tags = {
    name = "iam-s3-user"
  }
  
}

resource "aws_iam_access_key" "hsu" {
  user = aws_iam_user.hsu.name
}


data "aws_iam_policy_document" "s3_bucket_policy" {
  statement {
    actions = [
        "s3:Get**",
        "s3:List*",
        "s3-object-lambda:Get*",
        "s3-object-lambda:List*"
    ]
    resources = [aws_s3_bucket.tb.arn]
    effect = "Allow"
  }
}

resource "aws_iam_user_policy" "hsu_rol" {
  name = "hsu_role"

  user = aws_iam_user.hsu.name

  policy = data.aws_iam_policy_document.s3_bucket_policy.json
  
}
