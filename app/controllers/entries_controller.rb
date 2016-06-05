class EntriesController < ApplicationController
    before_action :set_entry, only: [:show, :edit, :update, :destroy, :vote, :unvote]
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  respond_to :html

  def index
    @entries = Entry.all
    respond_with(@entries)
  end

  def show
    respond_with(@entry)
  end

  def new
    @entry = Entry.new
    respond_with(@entry)
  end

  def edit
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.user_id = current_user.id
    @entry.save
    respond_with(@entry)
  end

  def update
    @entry.update(entry_params)
    respond_with(@entry)
  end

  def destroy
    @entry.destroy
    respond_with(@entry)
  end
    
  def vote
    @entry.liked_by current_user
    @entry.total_votes = @entry.votes_for.size
    redirect_to :back
    #activity= Activity.create(params[:activity])
    #activity.actor_id = current_user.id
    #activity.action = " liked a post from "
    #activity.object_id= @style.id
    #activity.receiver_id= @style.user.id
    #activity.action_type="like"
    #activity.save
  end
  
  def unvote
      @entry.unliked_by current_user
      @entry.total_votes=@entry.votes_for.size
      redirect_to @entry
  end

  private
    def set_entry
      @entry = Entry.find(params[:id])
    end

    def entry_params
      params.require(:entry).permit(:title, :description, :user_id, :tag, :reel)
    end
end
