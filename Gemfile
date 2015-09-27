source 'https://rubygems.org'

ruby '2.2.3'

gem 'sinatra'
gem 'sidekiq'
gem 'redis'

gem 'pg'
gem 'activerecord'
gem 'sinatra-activerecord'
gem 'active_model_serializers', :git => 'git://github.com/rails-api/active_model_serializers.git', :ref => 'af280ab'

gem 'sinatra-contrib'

group :production do
  gem 'unicorn'
end

group :development do
  gem 'capistrano'
  gem 'capistrano-bundler', '~> 1.1.2'
  gem 'shotgun'
end