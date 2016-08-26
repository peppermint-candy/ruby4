class User < ActiveRecord::Base
  has_secure_password

  has_many :playlists
  has_many :songs , through: :playlists


  validates :first_name, :last_name , :password , presence:true

  validates :password, length: { minimum: 8 }

  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, :presence => true, :format => { :with => email_regex }, :uniqueness => true
  
end
