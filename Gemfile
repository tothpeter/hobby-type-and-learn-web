source 'https://rubygems.org'

ruby '2.2.3'

gem 'sinatra'
gem 'redis'

group :production do
  gem 'unicorn'
end

group :development do
  gem 'capistrano'
  gem 'capistrano-bundler', '~> 1.1.2'
  gem 'shotgun'
end