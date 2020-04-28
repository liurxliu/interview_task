class AdminController < ApplicationController
  before_action :admin_only

  def admin_only
    redirect_to '/' unless current_user && current_user.admin
  end
end
