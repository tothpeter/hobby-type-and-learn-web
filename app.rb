require 'bundler'
Bundler.require

get '*' do
  html = redis.get deploy_key

  insert_current_user_meta html
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

def insert_current_user_meta html
  html.insert(head_pos(html), "<meta name='current-user' content='#{current_user_json}'>")
end

def head_pos html
  html.index(">", html.index("<head")) + 1
end

def current_user_json
  "{a:1}"
end