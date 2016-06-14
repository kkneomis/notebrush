class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_voter
  include Gravtastic
  gravtastic
    
  ratyrate_rater
    
  has_many :entries, dependent: :destroy  
  has_many :videos
    
  has_many :active_relationships,  class_name:  "Relationship",
                                   foreign_key: "follower_id",
                                   dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
   


  # Follows a user.
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # Unfollows a user.
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end
  
  def feed
      
      
      following_ids = "SELECT followed_id FROM relationships
                     WHERE  follower_id = :user_id"
      
      repost_ids = "SELECT entry_id FROM reposts
                    WHERE reposter_id IN (#{following_ids})"
      
      Entry.where("user_id IN (#{following_ids}) OR id IN (#{repost_ids})
                     OR user_id = :user_id", user_id: id) 
      
      #Entry.where("user_id IN (:following_ids) OR user_id = :user_id OR id IN (:repost_ids)",
       #           following_ids: following_ids, user_id: id, repost_ids: repost_ids)
  end
    
end
