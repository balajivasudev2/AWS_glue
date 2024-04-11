
resource "aws_glue_job" "glue-job" {
  name = "${var.job-name}"
  role_arn = "${var.glue-arn}"
  description = "This script applies mapping and handles null values"
  max_retries = "1"
  timeout = 5
  command {
    script_location = "s3://${var.bucket-name}/${var.file-name}"
    python_version = "3"
  }
  execution_property {
    max_concurrent_runs = 2
  }
  glue_version = "3.0"
}
