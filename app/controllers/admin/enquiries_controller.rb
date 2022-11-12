module Admin
  class EnquiriesController < BaseController
    def index
      @enquiries = @current_website.enquiries
    end

    def edit
      @post = @current_website.enquiries.find(params[:id])
    end

    def update
      @post = @current_website.enquiries.find(params[:id])
      if @post.update(post_params)
        redirect_to admin_enquiries_path, success: t(".success")
      else
        render :edit
      end
    end

    def destroy
      @current_website.enquiries.find(params[:id]).destroy
      redirect_to admin_posts_path, success: t(".success")
    end

    private

    def post_params
      params.require(:enquiry).permit(:title, :status, :content)
    end
  end
end
