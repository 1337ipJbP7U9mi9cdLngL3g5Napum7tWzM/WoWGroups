class GroupsController < ApplicationController
  before_action :js_pack_tag

  def new
    @regions = Region.all
    @servers = Server.where(region_id: 1).order(:name)
    @group = Group.new
  end

  def create
    a = params[:levels].split(',').map(&:to_i)
    pp a
    redirect_to new_group_path
  end


  private

  def js_pack_tag
    @js_pack_tag = {js: 'group_create'}
  end

end
