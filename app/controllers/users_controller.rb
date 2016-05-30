class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @short_urls = @user.short_urls.order('created_at desc').paginate(page: params[:page])
    # unless @user == current_user
    #   flash[:error] = "Access denied"
    #   redirect_to :back
    # end
  end

end
