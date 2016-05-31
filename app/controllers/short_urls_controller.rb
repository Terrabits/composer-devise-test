class ShortUrlsController < ApplicationController
  before_action :authenticate_user!

  # POST /short_urls
  def create
    @short_url = current_user.short_urls.build(short_url_params)
    if @short_url.save
      redirect_to :back, notice: 'Short url was successfully created.'
    else
      flash[:error] = @short_url.errors.full_messages.first
      redirect_to :back
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def short_url_params
      params.require(:short_url).permit(:url, :title)
    end
end
