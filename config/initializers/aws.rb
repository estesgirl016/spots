Aws.config.update({
  region: 'US-Standard',
  credentials: Aws::Credentials.new(
    ENV['AWS_BUCKET_NAME'],
    ENV['AWS_ACCESS_KEY_ID'],
    ENV['AWS_SECRET_ACCESS_KEY']
    )

})

S3_BUCKET_NAME = Aws::S3::Resource.new.bucket(ENV['S3_BUCKET_NAME'])
