# start glue resources here
resource "aws_glue_crawler" "glue-crawler" {
  database_name = "default"
  name          = "loan_reject_crawler_1"
  role          = "service-role/AWSGlueServiceRole-glue-iam"

  s3_target {
    path = "s3://test-bucket-61298376987/data/"
  }
}

//
//resource "aws_glue_job" "example" {
//  name     = "example"
//  role_arn = aws_iam_role.example.arn
//
//  command {
//    script_location = "s3://${aws_s3_bucket.example.bucket}/example.py"
//  }
//}

