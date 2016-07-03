class Entry < ActiveRecord::Base
  mount_uploader :reel, VideoUploader
  belongs_to :user
    has_many :reposts, dependent: :destroy
  ratyrate_rateable 
    
  acts_as_votable
  acts_as_taggable
    
    
    def reposted
        @repost_count = Repost.where(entry_id: self.id, reposter_id: user.id).size
        if @repost_count > 0
            return true
        else
            return false
        end
    end
    
    def count
        @repost_count = Repost.where(entry_id: self.id, reposter_id: :current_user).size
        if @repost_count > 0
            return @repost_count
        else
            return false
        end
    end
    
    
  def next
      self.class.where(:album_id => album_id).where("id > ?", id).first
  end

  def previous
    self.class.where(:album_id => album_id).where("id < ?", id).last
  end
    

  def self.search(search)
   where("description LIKE ?", "%#{search}%") and
   where("tag LIKE ?", "%#{search}%") and
   where("title LIKE ?", "%#{search}%")
  end
    
end
