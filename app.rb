require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  
  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  get '/bookmarks/new' do
    erb :'bookmarks/add_bookmark'
  end

  post '/bookmarks' do
    Bookmark.add_bookmark(url: params['url'])
    redirect '/bookmarks'
  end


  run! if app_file == $PROGRAM_NAME

end