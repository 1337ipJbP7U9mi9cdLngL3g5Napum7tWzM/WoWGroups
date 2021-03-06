class GroupsController < ApplicationController
  # before_action :js_pack_tag

  def show
    js_pack_tag('group_show')
    @group = Group.find(params[:id])
    @request = Request.new
    @requests = Request.where({group_id: @group.id})
  end

  def new
    js_pack_tag('group_create')
    @regions = Region.all
    @servers = Server.where(region_id: 1).order(:name)
    @group = Group.new
  end

  def create
    levels = params[:levels].split(',').map(&:to_i)
    group_roles_amounts = params[:group_roles_amounts].map(&:to_i)

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
      x.faction_cross = true if params[:faction_cross]
      x.time = params[:datetime] if params[:datetime]
      x.short_description = params[:short_description]
      x.description = params[:group][:description] if params[:group][:description] != ""
      x.active = true
    end

    redirect_to group_path(group_params(group))
  end


  def accept
    group = Group.find(params[:group_id])
    if current_user && current_user.id == group.user_id
      unless group.group_accepted.include?(params[:user_id])
        group.group_accepted << params[:user_id]
        group.save
      end
    end
    redirect_to group_path(params[:group_id])
  end

  def deny
    group = Group.find(params[:group_id])
    if current_user && current_user.id == group.user_id
      if group.group_accepted.include?(params[:user_id])
        group_accepted = group.group_accepted
        group_accepted.delete(params[:user_id])
        group.group_accepted = group_accepted
      end
      unless group.group_deny.include?(params[:user_id]) || group.group_deny == nil
        group.group_deny
      end
      group.save
    end
  end


  private

  def js_pack_tag(pack_tag_name)
    @js_pack_tag = {js: pack_tag_name, css: pack_tag_name}
  end

  def group_params(group)
    if group.private
      group_params = {id: group.id, private_url: group.private_url}
    else
      group_params = {id: group.id}
    end
    return group_params
  end

end
