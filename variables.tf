variable "job-language" {
  default = "python"
}

variable "bucket-name" {
  default = "my-python-script-bucket"
}
variable "glue-arn" {
  default = "arn:aws:iam::383826270918:role/gluerole"

}

variable "job-name" {
  default = "gluejob"
}
variable "file-name" {
  default = "pythonscript.py"
}