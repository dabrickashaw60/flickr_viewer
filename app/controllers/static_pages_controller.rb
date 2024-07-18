require 'flickr'

class StaticPagesController < ApplicationController
  def home
    if params[:user_id].present?
      flickr = Flickr.new(ENV['flickr_api_key'], ENV['flickr_shared_secret'])
      begin
        @photos = flickr.photos.search(user_id: params[:user_id])
      rescue Flickr::FailedResponse => e
        flash[:alert] = "Failed to fetch photos: #{e.message}"
    end
  end
end
end