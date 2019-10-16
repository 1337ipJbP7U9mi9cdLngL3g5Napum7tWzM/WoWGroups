class SessionsController < ApplicationController
  def create
    token = auth_hash.credentials.token
    user_id = auth_hash.info.id

    if User.find_by(guid: user_id)
      user = User.find_by(guid: user_id)
    else
      user = nil
    end

    if user != nil && user.username != nil
      user.update!(token: token)
      session[:user_id] = user_id
      redirect_to root_path
    elsif user.nil?
      user = User.create do |x|
        x.guid = user_id
        x.token = token
      end
      session[:user_id] = user_id
      redirect_to edit_user_path(user)
    else
      session[:user_id] = user_id
      redirect_to edit_user_path(user)
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

 protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
