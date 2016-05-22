class Entry < ActiveRecord::Base
  mount_uploader :reel, VideoUploader

  belongs_to :user
end
