class RedirectController < ApplicationController
  def to_url
    id = ShortUrl.lengthen(params[:id])
    @short_url = ShortUrl.find(id)
    redirect_to @short_url.url, status: 302
  end
end
