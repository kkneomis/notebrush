class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @entries = Entry.where(user_id: @user.id)
    end
    

    
      def following
        @title = "Following"
        @user  = User.find(params[:id])
        @users = @user.following.paginate(page: params[:page])
        render 'show_follow'
      end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

end
