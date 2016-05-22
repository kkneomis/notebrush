class Entry < ActiveRecord::Base
  mount_uploader :reel, VideoUploader

  belongs_to :user
    
    
    def next
        entry.where(:id == self.id)
    end
    
end
