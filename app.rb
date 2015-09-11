require 'bundler'
Bundler.require

if settings.production?
  ActiveRecord::Base.establish_connection(
    :adapter  => "postgresql",
    :username => ENV['TYPE_AND_LEARN_API_DATABASE_USER'],
    :password => ENV['TYPE_AND_LEARN_API_DATABASE_PASSWORD'],
    :database => "type_and_learn_api_production",
    :encoding => "unicode",
    :pool => 5
  )
else
  ActiveRecord::Base.establish_connection(
  :adapter  => "postgresql",
  :database => "type_and_learn_api_development",
  :encoding => "unicode",
  :pool => 5
)
end


class User < ActiveRecord::Base
  has_many :labels
end

class Label < ActiveRecord::Base
  belongs_to :user
end

class UserSerializer < ActiveModel::Serializer
  attributes :id, :email

  has_many :labels
end

class LabelSerializer < ActiveModel::Serializer
  attributes :title, :position, :user_id

  belongs_to :user
end

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
  @redis ||= Redis.new
end

def insert_current_user_meta html
  user = current_user

  if user
    serializer = UserSerializer.new user
    adapter = ActiveModel::Serializer::Adapter::JsonApi.new serializer, include: ['labels']
    current_user_json = adapter.serializable_hash

    html.insert(head_pos(html), "<meta name='current-user' content='#{current_user_json}'>")
  else
    html
  end
end

def head_pos html
  html.index(">", html.index("<head")) + 1
end

def current_user
  User.find_by auth_token_for_web: cookies[:auth_token_for_web]
end