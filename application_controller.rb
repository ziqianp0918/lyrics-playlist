require 'dotenv/load'
require 'bundler'
require 'lyricfy'
require 'rspotify'
Bundler.require

require_relative 'models/model.rb'

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index
  end
  
  post '/result' do
    user_name = params[:name]
    user_playlist_id = params[:playlist_id]
    @user_playlist = Playlist.new(user_name,user_playlist_id)
    @user_playlist.get_info
    @user_playlist.get_lyrics
    
    erb :result
  end

end