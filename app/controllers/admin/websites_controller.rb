module Admin
  class WebsitesController < BaseController
    def edit
      @website = @current_website
    end

    def update
      @website = @current_website
      if @website.update(website_params)
        redirect_to admin_root_path, notice: t(".success")
      else
        render :edit
      end
    end

    private

    def website_params
      params.require(:website).permit(:name)
    end
  end
end