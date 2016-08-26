class UsersController < ApplicationController
  def create
    user = User.new(first_name:params[:first_name], last_name:params[:last_name], email:params[:email], password:params[:password])

    if user.valid?
      user.save
      last_user = User.last
      session[:user_id] = last_user.id
      redirect_to '/songs'
    else
      flash[:errors] = [user.errors.full_messages]
      redirect_to :back
    end
  end

  def index
  end

  def show
    @user = User.find(params[:id])
    @playlists = Playlist.where(user:@user)
  end
end
