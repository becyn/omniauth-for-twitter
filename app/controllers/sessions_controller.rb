class SessionsController < ApplicationController

def callback                                                                                               
     auth = request.env["omniauth.auth"]
     user = User.find_by_provider_and_uid(auth[:provider], auth[:uid])                                        
     if user.nil?                                                                                             
       user = User.create_with_omniauth(auth)                                                                 
     end
     if user.twitter_id != auth[:info][:nickname] ||                                                          
       user.icon_url != auth[:info][:image]                                                                   
       user.twitter_id = auth[:info][:nickname]                                                               
       user.icon_url = auth[:info][:image]                                                                    
       user.save                                                                                              
     end
     session[:user_id] = user.id                                                                              
     redirect_to root_url, :notice => "login&quot"                                                            
   end
     
   def destroy
     session[:user_id] = nil
     redirect_to root_url, :notice => "Logged out"                                                            
   end
     
   def failure
     redirect_to root_path                                                                                    
   end

end
