class CreateEnquiryForms < ActiveRecord::Migration[7.0]
  def change
    create_table :enquiry_forms do |t|
      t.references :website, null: false, foreign_key: true
      t.string :title
      t.string :introduction
      t.string :success_message
      t.boolean :default_form, default: false
      t.timestamps
    end
  end
end
