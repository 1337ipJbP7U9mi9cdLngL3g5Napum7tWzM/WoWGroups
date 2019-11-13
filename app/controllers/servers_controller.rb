class ServersController < ApplicationController

  def index
    @servers = Server.where(region_id: params[:region]).order(:name)
    render partial: "server_options"
  end

end
