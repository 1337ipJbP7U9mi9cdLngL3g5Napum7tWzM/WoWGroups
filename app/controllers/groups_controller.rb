class GroupsController < ApplicationController
  before_action :js_pack_tag

  def show
    @group = Group.find(params[:id])
    @request_application = Request.new
    @requests = Request.where({group_id: @group.id})
  end

  def new
    @regions = Region.all
    @servers = Server.where(region_id: 1).order(:name)
    @group = Group.new
  end

  def create
    levels = params[:levels].split(',').map(&:to_i)
    group_roles_amounts = params[:group_roles_amounts].split(',').map(&:to_i)

    group = Group.create do |x|
      x.user_id = current_user.id
      x.group_type = params[:type]
      x.private = true if params[:private]
      x.private_url = params[:private_url] if params[:private_url]
      x.levels = levels
      x.group_size = params[:group_size]
      x.group_tanks = group_roles_amounts[0]
      x.group_heals = group_roles_amounts[1]
      x.group_dps = group_roles_amounts[2]
      x.server_id = params[:server]
      x.group_accepted = [current_user.id]
      x.faction = params[:faction]
      x.faction_cross = params[:faction_cross] if params[:faction_cross]
      x.time = params[:datetime] if params[:datetime]
      x.short_description = params[:short_description]
      x.description = params[:group][:description] if params[:group][:description] != ""
      x.active = true
    end

    redirect_to group_path(group_params(group))
  end


  private

  def js_pack_tag
    @js_pack_tag = {js: 'group_create'}
  end

  def group_params(group)
    if group.private_url
      group_params = {id: group.id, private_url: group.private_url}
    else
      group_params = {id:group.id}
    end
    return group_params
  end

end
