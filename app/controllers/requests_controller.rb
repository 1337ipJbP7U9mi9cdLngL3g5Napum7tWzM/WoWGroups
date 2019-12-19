class RequestsController < ApplicationController

  def create

    redirect_to group_path(params[:id])
  end

end
