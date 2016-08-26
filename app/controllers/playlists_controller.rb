class PlaylistsController < ApplicationController
  def show
  end

  def index
  end

  def create

    user = User.find(current_user.id)
    song = Song.find(params[:song_id])

    playlist = Playlist.where(user:user, song:song)

    if playlist.exists?
      plusone = playlist.first.count
      plusone += 1
      playlist.first.update_attribute(:count, plusone)

    else

      new_playlist = Playlist.new(user:user, song:song, count:1)
      if new_playlist.valid?
        new_playlist.save
      else
        flash[:errors] = ["Oops! Somehting went wrong try again"]
      end
    end
    addone = song.add
    addone += 1
    song.update_attribute(:add, addone)

    redirect_to '/songs'
  end


end
