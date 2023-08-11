module "hello_world" {
  source = "terraform-aws-modules/lambda/aws"

  function_name = "hello-world"
  role_name     = "hello-world"
  description   = "Example Golang function for Reproducible Builds"
  handler       = "bootstrap"
  runtime       = "provided.al2"
  architectures = ["arm64"]

  create_package = false
  s3_existing_package = {
    bucket     = local.artifacts_bucket
    key        = "go/hello_world.zip"
    version_id = data.aws_s3_object.go_version["go/hello_world.zip"].version_id
  }
}
