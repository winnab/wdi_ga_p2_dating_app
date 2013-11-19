# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick
  include CarrierWave::MimeTypes
  process :set_content_type

  # storage :file
  storage :fog 
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    ActionController::Base.helpers.asset_path("fallbacks/placeholder.jpg")
  end

  version :thumb do
    process :resize_to_fit => [50, 50]
  end

  version :search do
    process :resize_to_fit => [200, 200]
  end

  version :gallery do
    process :resize_to_fit => [400, 400]
  end

end
