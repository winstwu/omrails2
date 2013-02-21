# If an s3.yml file exists, use the key, secret key, and bucket values from there.
# Otherwise, pull them from the environment.
if File.exists?("#{Rails.root}/config/s3.yml")
  s3_config = YAML.load_file("#{Rails.root}/config/s3.yml")
  S3[:key] = s3_config[Rails.env]['key']
  S3[:secret] = s3_config[Rails.env]['secret']
  S3[:bucket] = s3_config[Rails.env]['bucket']
else
  S3[:key] = ENV['AWS_ACCESS_KEY_ID']
  S3[:secret] = ENV['AWS_SECRET_ACCESS_KEY']
  S3[:bucket] = ENV['AWS_BUCKET']
end