class HomeController < ApplicationController
  before_action :find_website

  def index
    render @current_website.view_path, layout: @current_website.layout_path
  end
end
