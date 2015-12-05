require 'rubygems'
require 'sinatra/base'
require 'sinatra/reloader'
require 'pp'

require './model'
require './index'
require './api/api'

Encoding.default_external = 'utf-8'

$stdout.sync = true

map('/api') { run Api }

class PopDict < Sinatra::Base
helpers Sinatra::Cookies

set :views, settings.root + '/html'
set :public_folder, File.dirname(FILE) + '/static'

configure :development do
register Sinatra::Reloader
enable :sessions
use Rack::Session::Cookie, :path => '/'

end

# Index のページを表示する
get '/' do
pp cookies
pp session
if !session.has_key?('id')
erb :notlogin

else
  erb :dict, :locals => {:name => cookies[:id]}
end
end

configure :development do
$logger = Logger.new(STDOUT)
end

end

run PopDictrequire 'rubygems'
require 'sinatra/base'
require 'sinatra/reloader'
require 'pp'

require './model'
require './index'
require './api/api'

Encoding.default_external = 'utf-8'

$stdout.sync = true

map('/api') { run Api }

class PopDict < Sinatra::Base
helpers Sinatra::Cookies

set :views, settings.root + '/html'
set :public_folder, File.dirname(FILE) + '/static'

configure :development do
register Sinatra::Reloader
enable :sessions
use Rack::Session::Cookie, :path => '/'

end

# Index のページを表示する
get '/' do
pp cookies
pp session
if !session.has_key?('id')
erb :notlogin

else
  erb :dict, :locals => {:name => cookies[:id]}
end
redirect '/'
end

configure :development do
$logger = Logger.new(STDOUT)
end

end

run PopDict
