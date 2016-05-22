# encoding: utf-8

class VideoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

end
