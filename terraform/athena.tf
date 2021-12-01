//resource "aws_s3_bucket" "s3bucket" {
//  bucket = "test-bucket-poc-nick"
//}

//resource "aws_kms_key" "test" {
//  deletion_window_in_days = 7
//  description             = "Athena KMS Key"
//}

//resource "aws_athena_workgroup" "test" {
//  name = "example"
//
//  configuration {
//    result_configuration {
//      encryption_configuration {
//        encryption_option = "SSE_"
//        kms_key_arn       = aws_kms_key.test.arn
//      }
//    }
//  }
//}
//
//resource "aws_athena_database" "athenadb" {
//  name   = "users"
//  bucket = aws_s3_bucket.s3bucket.id
//}


# calculating ma 50
resource "aws_athena_named_query" "ma50-query-2007" {
  name      = "ma50-query-2007"
  workgroup = "primary"
  database  = "data"
  query     = "select *,avg(data.risk_score) over(order by data.\"application date\" rows between 50 preceding and current row) as RiskScoreMA50 from data where data.\"application date\" like '2007%';"
}

# calculating ma 50 2008-2009
resource "aws_athena_named_query" "ma50-query-2008-2009" {
  name      = "ma50-query-2008-2009"
  workgroup = "primary"
  database  = "data"
  query     = "select *,avg(data.risk_score) over(order by data.\"application date\" rows between 50 preceding and current row) as RiskScoreMA50ST from data where data.\"application date\" between '2008-01-01' and '2009-12-31';"
}


## calculating ma 100
resource "aws_athena_named_query" "ma100-query" {
  name      = "ma100-query"
  workgroup = "primary"
  database  = "data"
  query     = "select *,avg(data.risk_score) over(order by data.\"application date\" rows between 50 preceding and current row) as RiskScoreMA100 from data where data.\"application date\" > '2009-01-01';"
}

## calculating ema 50
resource "aws_athena_named_query" "ema50-query" {
  name      = "ema50-query"
  workgroup = "primary"
  database  = "data"
  query     = "select *,avg(data.risk_score) over(order by data.\"application date\" rows between 50 preceding and current row) as RiskScoreEMA50 from data where data.\"application date\" like '2007%';"
}