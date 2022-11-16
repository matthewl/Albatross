module Admin
  class EnquiryFormsController < BaseController
    def index
      @enquiry_forms = @current_website.enquiry_forms
    end

    def new
      @enquiry_form = @current_website.enquiry_forms.new
    end

    def create
      @enquiry_form = @current_website.enquiry_forms.new(enquiry_form_params)
      if @enquiry_form.update(enquiry_form_params)
        set_default_enquiry_form
        redirect_to admin_enquiry_forms_path, success: t(".success")
      else
        render :new
      end
    end

    def edit
      @enquiry_form = @current_website.enquiry_forms.find(params[:id])
    end

    def update
      @enquiry_form = @current_website.enquiry_forms.find(params[:id])
      if @enquiry_form.update(enquiry_form_params)
        set_default_enquiry_form
        redirect_to admin_enquiry_forms_path, success: t(".success")
      else
        render :edit
      end
    end

    def destroy
      @current_website.enquiry_forms.find(params[:id]).destroy
      redirect_to admin_enquiry_forms_path, success: t(".success")
    end

    private

    def enquiry_form_params
      params
        .require(:enquiry_form)
        .permit(:title, :introduction, :success_message, :active)
    end

    def set_default_enquiry_form
      return if @enquiry_form.website.enquiry_forms.count > 1
      @enquiry_form.update_attribute(:default_form, true)
    end
  end
end
