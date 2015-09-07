require 'sinatra'

get '*' do
  redis.get deploy_key
end

def deploy_key
  params[:version] ||= redis.get "study-rack:current"
  # params[:version] ||= 'release'
  case params[:version]
  when 'release' then 'release'
  when 'canary'  then  redis.lindex('releases', 0)
  else
    params[:version]
  end
end

def redis
  # settings.development?
  # settings.production?
  if ENV['REDISTOGO_URL']
    Redis.new(:url => ENV['REDISTOGO_URL'])
  else
    redis = Redis.new()
  end
end