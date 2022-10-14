class PostsController < ApplicationController
  before_action :find_website

  def show
    @post = @current_website.posts.find_by(slug: params[:id])

    if @post
      render @current_website.view_path("posts/show"), layout: @current_website.layout_path
    else
      redirect_to root_url(subdomain: @current_website.subdomain), status: :not_found
    end
  end
end
