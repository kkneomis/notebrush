class RepostController < ApplicationController
    before_action :authenticate_user!
    
    def share
        @entry = Entry.find(params[:id])
        @repost_count = Repost.where(id: @entry.id, reposter_id: current_user.id).size
        if @repost_count == 0
            @repost = Repost.new()
            @repost.entry_id = @entry.id
            @repost.reposter_id = current_user.id
            @repost.poster_id = @entry.user.id
            @repost.save 
            redirect_to feed_path
            flash.notice = "Video reposted!"
        else
            flash.notice = "You have already shared this post"
            redirect_to feed_path
        end
    end 
    
    
    def unshare
        @entry = Entry.find(params[:id])
            @reposts= Repost.where(entry_id: @entry.id, reposter_id: current_user.id) 
            @reposts.each do |repost|
                repost.destroy
            end
            redirect_to feed_path
            flash.notice = "Video unreposted!"
    end 
    
end
