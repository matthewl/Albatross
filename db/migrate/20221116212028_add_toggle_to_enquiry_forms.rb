class AddToggleToEnquiryForms < ActiveRecord::Migration[7.0]
  def change
    add_column :enquiry_forms, :active, :boolean, default: false
  end
end
