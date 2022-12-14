class CreateEnquiries < ActiveRecord::Migration[7.0]
  def change
    create_table :enquiries do |t|
      t.references :website, null: false, foreign_key: true
      t.references :enquiry_form, null: false, foreign_key: true
      t.integer :status, default: 0
      t.string :contact_name
      t.string :contact_number
      t.string :email
      t.string :email_confirmation
      t.text :message
      t.datetime :closed_at
      t.timestamps
    end
  end
end
