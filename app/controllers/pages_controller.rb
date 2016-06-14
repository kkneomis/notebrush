class PagesController < ApplicationController
    before_filter :authenticate_user!, only: [:feed]
  def home
      @entries = Entry.last(3)
  end

    def feed
        @user = current_user
        @following = @user.following
        @followers = @user.followers
        @entries =  current_user.feed.order(created_at: :desc)
    end

  def elements
  end

  def forms
  end
end
