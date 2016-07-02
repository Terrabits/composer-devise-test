class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    redirect_to :back unless current_user.admin?
    @users = User.paginate(page: params[:page])
  end

  def show
    if !current_user.admin? && current_user != User.find(params[:id])
      redirect_to :back
    end

    @user = User.find(params[:id])
    @short_urls = @user.short_urls.order('created_at desc').paginate(page: params[:page])
  end

end
