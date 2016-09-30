Aws.config.update({
  region: 'us-standard',
  credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY']),
    ENV['AWS_BUCKET_NAME'])
})

S3_BUCKET = Aws::S3::Resource.new.bucket(ENV['S3_BUCKET'])
