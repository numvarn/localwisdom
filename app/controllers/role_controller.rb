class RoleController < ApplicationController
    load_and_authorize_resource
  def list
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @role_items = Role.all
  end

  def submit
    user = User.find(params[:user_id])
    user.roles.clear
    if params[:role_checkbox]
        params[:role_checkbox].each do |item|
            role = Role.find(item)
            user.roles << role
        end
    end

    flash[:notice] = "User roles has been update"
    redirect_to controller: "role", action: "list"
  end
end
