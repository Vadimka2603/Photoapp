class PictureUploader < CarrierWave::Uploader::Base
  
  include CarrierWave::MiniMagick
  process resize_to_limit: [700, 700]
  storage :fog
end
