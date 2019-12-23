class HomeController < ApplicationController
  before_action :js_pack_tag

  def index
    @user = current_user if current_user
    @regions = Region.all
    @servers = Server.where(region_id: 1).order(:name)
    @groups = Group.last(10)
  end

  def search
    redirect_to root_path
  end

  private

  def js_pack_tag
    @js_pack_tag = {js: 'home_page'}
  end

end
