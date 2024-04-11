resource "aws_s3_bucket" "my_source" {
  bucket = "my-source-bucket-data"
  tags = {
    Name        = "My_source_bucket"
  }

}

resource "aws_s3_bucket_public_access_block" "my_source" {
  bucket = aws_s3_bucket.my_source.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}


resource "aws_s3_bucket" "my_destination" {
  bucket = "my-destination-bucket-data"
  
  tags = {
    Name        = "My_destination_bucket"
  }
}

resource "aws_s3_bucket_public_access_block" "my_destination" {
  bucket = aws_s3_bucket.my_destination.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}



resource "aws_s3_bucket" "my_python_script_bucket" {
  bucket = "my-python-script-bucket"
  
  tags = {
    Name        = "My_script_bucket"
  }

}

resource "aws_s3_bucket_public_access_block" "my_python_script_bucket" {
  bucket = aws_s3_bucket.my_python_script_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

