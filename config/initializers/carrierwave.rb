CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider  => 'AWS',  # required
    :aws_access_key_id  => "AWS_ACCESS_KEY_ID",  # required
    :aws_secret_access_key  => 'SECRET_ACCESS_KEY',  # required
    :region => 'eu-west-1',  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'WDI_P2_S3_BUCKET'  # required
  config.fog_public  = true  # optional, defaults to true
end