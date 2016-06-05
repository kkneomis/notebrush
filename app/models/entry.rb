class Entry < ActiveRecord::Base
  mount_uploader :reel, VideoUploader

  belongs_to :user
  ratyrate_rateable 
    
  acts_as_votable
    
end
