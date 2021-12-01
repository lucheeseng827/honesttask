resource "aws_glue_schema" "schemabase" {
  schema_name       = "schema-base-a"
  registry_arn      = "arn:aws:glue:ap-southeast-1:734663932710:registry/schema-reg"
  data_format       = "AVRO"
  compatibility     = "FULL_ALL"
  schema_definition = "{\"type\": \"record\", \"name\": \"r1\", \"fields\": [ {\"name\": \"f1\", \"type\": \"int\"}, {\"name\": \"f2\", \"type\": \"string\"} ]}"
}

resource "aws_glue_schema" "schemabase2" {
  schema_name       = "schema-base-b"
  registry_arn      = "arn:aws:glue:ap-southeast-1:734663932710:registry/schema-reg"
  data_format       = "AVRO"
  compatibility     = "FULL_ALL"
  schema_definition = "{\"type\": \"record\", \"name\": \"r1\", \"fields\": [ {\"name\": \"f1\", \"type\": \"int\"}, {\"name\": \"f2\", \"type\": \"string\"} ]}"
}