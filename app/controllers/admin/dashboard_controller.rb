module Admin
  class DashboardController < BaseController
    def index
      @open_enquiries = @current_website.enquiries.open
    end
  end
end
