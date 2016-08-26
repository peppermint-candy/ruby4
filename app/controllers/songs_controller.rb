class SongsController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
    @others = Playlist.where(song:@song)
  end

  def create

    song = Song.where(title:params[:title], artist:params[:artist])

    if song.any?
      flash[:errors] = ["This song already exists"]
      redirect_to :back
    else
      newSong = Song.new(title:params[:title], artist:params[:artist], add:0)
      if newSong.valid?
        newSong.save
        redirect_to '/songs'
      else
        flash[:errors] = ["Opps! Someting went wrong please try again"]
        redirect_to :back
      end
    end
  end




end
