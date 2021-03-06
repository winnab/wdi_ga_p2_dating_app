# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick
  include CarrierWave::MimeTypes
  process :set_content_type

  # storage :file
  storage :fog 
  
  def store_dir # for s3 https://github.com/carrierwaveuploader/carrierwave/wiki/How-to%3A-Make-Carrierwave-work-on-Heroku
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def cache_dir
    "#{Rails.root}/tmp/uploads"
  end

  def default_url
    ActionController::Base.helpers.asset_path("fallbacks/" + [version_name, "default.png"].compact.join('_'))
  end

  version :thumb do
    process :resize_to_fit => [50, 50]
  end

  version :search do
    process :resize_to_fit => [200, 200]
  end

end
