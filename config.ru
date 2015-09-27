require './app.rb'
run Sinatra::Application

# Sidekiq
# require 'sidekiq'

# Sidekiq.configure_client do |config|
#   config.redis = { :size => 1 }
# end


map ENV['sidekiq_web_path'] do
  require 'bundler'
  Bundler.require
  require 'sidekiq'
  require 'sidekiq/web'

  use Rack::Auth::Basic, "Protected Area" do |username, password|
    username == ENV['sidekiq_web_user'] && password == ENV['sidekiq_web_password']
  end

  run Sidekiq::Web
end