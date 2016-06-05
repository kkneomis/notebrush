class Entry < ActiveRecord::Base
  mount_uploader :reel, VideoUploader

  belongs_to :user
    ratyrate_rateable 
    
    def next
        entry.where(:id == self.id)
    end
    
end
