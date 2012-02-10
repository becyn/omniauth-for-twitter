class PagesController < ApplicationController
def index
     if authenticated?
       return redirect_to user_path(current_user)
     end
   end
end
