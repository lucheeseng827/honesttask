

# calculating ma 50
resource "aws_athena_named_query" "ma50-query-2007" {
  name      = "ma50-query-2007"
  workgroup = "primary"
  database  = "default"
  query     = "select *,avg(data.risk_score) over(order by data.\"application date\" rows between 50 preceding and current row) as RiskScoreMA50 from data where data.\"application date\" like '2007%';"
}

# calculating ma 50 2008-2009
resource "aws_athena_named_query" "ma50-query-2008-2009" {
  name      = "ma50-query-2008-2009"
  workgroup = "primary"
  database  = "default"
  query     = "select *,avg(data.risk_score) over(order by data.\"application date\" rows between 50 preceding and current row) as RiskScoreMA50ST from data where data.\"application date\" between '2008-01-01' and '2009-12-31';"
}

## calculating ma 100
resource "aws_athena_named_query" "ma100-query" {
  name      = "ma100-query"
  workgroup = "primary"
  database  = "default"
  query     = "select *,avg(data.risk_score) over(order by data.\"application date\" rows between 50 preceding and current row) as RiskScoreMA100 from data where data.\"application date\" > '2009-01-01';"
}

## calculating ema 50
resource "aws_athena_named_query" "ema50-query" {
  name      = "ema50-query"
  workgroup = "primary"
  database  = "default"
  query     = "select *,avg(data.risk_score) over(order by data.\"application date\" rows between 50 preceding and current row) as RiskScoreEMA50 from data where data.\"application date\" like '2007%';"
}