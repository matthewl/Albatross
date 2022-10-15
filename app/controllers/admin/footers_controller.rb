module Admin
  class FootersController < BaseController
    def edit
      @footer = @current_website.footer
    end

    def update
      @footer = @current_website.footer
      if @footer.update(footer_params)
        redirect_to admin_root_path, notice: t(".success")
      else
        render :edit
      end
    end

    private

    def footer_params
      params.require(:footer).permit(:display_address, :display_copyright)
    end
  end
end
