resource "aws_s3_bucket" "static_site"  {
  bucket = "${var.bucket_name}"
}
resource "aws_s3_bucket_acl" "static_site"  {
  bucket = "${var.bucket_name}"
  acl    = "public-read"

}
resource "aws_s3_bucket_website_configuration" "static_site" {
  bucket = "${aws_s3_bucket.static_site.bucket}"

  index_document {
    suffix = "index.html"
  }
    error_document {
    key = "error.html"
  }
}

resource "aws_s3_object" "index" {
  bucket       = "${aws_s3_bucket.static_site.bucket}"
  key          = "index.html"
  source       = "src/index.html"
  content_type = "text/html"
  acl          = "public-read"
}

resource "aws_s3_object" "error" {
  bucket       = "${aws_s3_bucket.static_site.bucket}"
  key          = "error.html"
  source       = "src/error.html"
  content_type = "text/html"
  acl          = "public-read"
}
