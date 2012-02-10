class User < ActiveRecord::Base
def self.create_with_omniauth(auth)
     user = User.new
     user.provider = auth[:provider]
     user.uid = auth[:uid]
     user.twitter_id = auth[:info][:nickname]
     user.icon_url = auth[:info][:image]
     user.save
     return user
   end
end
