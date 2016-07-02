class ImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :thumbnail do
    process :eager => true
    process :resize_to_fill => [250, 250, :face]
  end

end