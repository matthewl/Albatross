class CreateEnquiries < ActiveRecord::Migration[7.0]
  def change
    create_table :enquiries do |t|
      t.references :website, null: false, foreign_key: true
      t.references :enquiry_form, null: false, foreign_key: true
      t.string :title
      t.string :first_name
      t.string :last_name
      t.string :premise_number
      t.string :thoroughfare
      t.string :locality
      t.string :region
      t.string :post_code
      t.string :telephone_number
      t.string :mobile_number
      t.string :email
      t.string :email_confirmation
      t.string :enquiry_type
      t.text :message
      t.timestamps
    end
  end
end
