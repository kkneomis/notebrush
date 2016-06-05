class PagesController < ApplicationController
  def home
      @entries = Entry.take(6)
  end

 def timeline
      @feed_items = current_user.feed.paginate(page: params[:page])
  end

  def elements
  end

  def forms
  end
end
