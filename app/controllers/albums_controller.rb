class AlbumsController < InheritedResources::Base

 def create
    @album = Album.new(album_params)
    @album.user_id = current_user.id
    @album.save
    respond_with(@album)
  end
    
  private

    def album_params
      params.require(:album).permit(:name, :cover, :user_id)
    end
end

