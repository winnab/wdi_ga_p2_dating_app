CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider  => 'AWS',  # required
    :aws_access_key_id  => ENV["AWS_ACCESS_KEY_ID"],  # required
    :aws_secret_access_key  => ENV["AWS_SECRET_ACCESS_KEY"],  # required
    :region => 'eu-west-1'  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = ENV['WDI_P2_S3_BUCKET']  # required
  config.fog_public  = true  # optional, defaults to true
  config.cache_dir = "#{Rails.root}/tmp/uploads" # for S3 https://github.com/carrierwaveuploader/carrierwave/wiki/How-to%3A-Make-Carrierwave-work-on-Heroku

end