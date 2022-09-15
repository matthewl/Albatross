module Admin
  class HeadersController < BaseController
    def edit
      @header = @current_website.headers.find(params[:id])
    end

    def update
      @header = @current_website.headers.find(params[:id])
      if @header.update(header_params)
        redirect_to admin_root_path, notice: t(".success")
      else
        render :edit
      end
    end

    private

    def header_params
      params.require(:header).permit(:title, :sub_title, :welcome)
    end
  end
end
