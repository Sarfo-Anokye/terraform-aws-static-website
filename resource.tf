resource "aws_s3_bucket" "sample-bucket" {
  bucket = "static-web2213"

  tags = {
    Name        = "My-staic-web"
    Environment = "Dev"
  }
}


# make the bucket publicly accessible
resource "aws_s3_bucket_public_access_block" "sample-bucket" {
  bucket = aws_s3_bucket.sample-bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# upload the index page
resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.sample-bucket.id
  key          = "index.html"
  source       = "html/index.html"
  content_type = "text/html"
}
# upload the error page
resource "aws_s3_object" "error" {
  bucket       = aws_s3_bucket.sample-bucket.id
  key          = "error.html"
  source       = "html/error.html"
  content_type = "text/html"
}

# website configuration
resource "aws_s3_bucket_website_configuration" "sample-bucket" {
  bucket = aws_s3_bucket.sample-bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

# make content public with bucket policy
resource "aws_s3_bucket_policy" "public_read_access" {
  bucket = aws_s3_bucket.sample-bucket.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": [ "s3:GetObject" ],
      "Resource": [
        "${aws_s3_bucket.sample-bucket.arn}",
        "${aws_s3_bucket.sample-bucket.arn}/*"
      ]
    }
  ]
}
EOF

  depends_on = [aws_s3_bucket_public_access_block.sample-bucket]
}

output "website_url" {
  value       = aws_s3_bucket_website_configuration.sample-bucket.website_endpoint
  description = "URL of the static website hosted on S3"
}
