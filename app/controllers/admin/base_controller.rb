module Admin
  class BaseController < ApplicationController
    before_action :find_website
    layout "admin"
  end
end
