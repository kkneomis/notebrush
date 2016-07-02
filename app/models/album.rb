class Album < ActiveRecord::Base
    belongs_to :user
    has_many :entries
    mount_uploader :cover, ImageUploader
end
