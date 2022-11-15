module Admin
  class EnquiriesController < BaseController
    def index
      @enquiries = @current_website.enquiries.order("created_at DESC")
    end

    def show
      @enquiry = Enquiry.find(params[:id])
    end

    def edit
      @enquiry = @current_website.enquiries.find(params[:id])
    end

    def update
      @enquiry = @current_website.enquiries.find(params[:id])
      if @enquiry.update(enquiry_params)
        redirect_to admin_enquiries_path, success: t(".success")
      else
        render :edit
      end
    end

    def destroy
      @current_website.enquiries.find(params[:id]).destroy
      redirect_to admin_enquiries_path, success: t(".success")
    end

    def open
      @enquiry = @current_website.enquiries.find(params[:id])
      @enquiry.update_attribute(:closed_at, nil)
      @enquiry.open!
      redirect_to admin_enquiry_path(@enquiry)
    end

    def close
      @enquiry = @current_website.enquiries.find(params[:id])
      @enquiry.update_attribute(:closed_at, Time.zone.now)
      @enquiry.closed!
      redirect_to admin_enquiry_path(@enquiry)
    end

    private

    def enquiry_params
      params.require(:enquiry).permit(:title, :status, :content)
    end
  end
end
