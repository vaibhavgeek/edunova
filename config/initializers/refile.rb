require "refile/s3"



aws = {
  access_key_id: "AKIAJQCJY4CA5VUEGMDA",
  secret_access_key: "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",
  region: "us-west-2",
  bucket: "vaibhavgeek"
}
Refile.cache = Refile::S3.new(prefix: "cache", **aws)
Refile.store = Refile::S3.new(prefix: "store", **aws)
