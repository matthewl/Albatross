class EnquiriesController < applicationController
  def create
    enquiry = Enquiry.new
    enquiry.update(enquiry_params)
    redirect_to root_path, notice: "Thanks for submitting your enquiry."
  end

  private

  def enquiry_params
    params
      .require(:enquiry)
      .permit(
        :website_id, :enquiry_form_id, :contact_name, :contact_number,
        :email, :email_confirmation, :message
      )
  end
end
