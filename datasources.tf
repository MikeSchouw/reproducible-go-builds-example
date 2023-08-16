data "aws_s3_objects" "go" {
  bucket = local.build_artifact_bucket
  prefix = "go"
}

data "aws_s3_object" "go_version" {
  for_each = toset(data.aws_s3_objects.go.keys)
  bucket   = local.build_artifact_bucket
  key      = each.value
}
