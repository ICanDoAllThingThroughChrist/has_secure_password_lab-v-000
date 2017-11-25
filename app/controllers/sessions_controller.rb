class SessionsController < ApplicationController
  def new
  end
  def create
   @user = User.find_by(name: params[:user][:name])
   return head(:forbidden) unless @user.authenticate(params[:user][:password])
   #returns the specified HTTP status code—in this case, if a user isn't authenticate, we return 403 Forbidden
   session[:user_id] = @user.id
 end

end
