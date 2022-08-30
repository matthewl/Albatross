module Admin
  class WebsitesController < BaseController
    def edit
      @website = @current_website
      @website.build_location unless @website.location.present?
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
      params.require(:website)
        .permit(
          :name,
          location_attributes: [
            :id, :name, :address_line_one, :address_line_two, :address_line_three,
            :address_line_four, :locality, :region, :post_code, :country,
            :website_id
          ]
        )
    end
  end
end