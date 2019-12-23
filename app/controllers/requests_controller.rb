class RequestsController < ApplicationController

  def create
    Request.create do |x|
      x.character = current_user.username
      x.level = params[:level]
      x.role = params[:role]
      x.description = params[:description]
      x.group_id = params[:id]
      x.user_id = current_user.id
    end

    redirect_to group_path(params[:id])
  end

end
