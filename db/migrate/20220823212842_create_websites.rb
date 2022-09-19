class CreateWebsites < ActiveRecord::Migration[7.0]
  def change
    create_table :websites do |t|
      t.references :account, null: false, foreign_key: true
      t.string :name
      t.string :subdomain, index: {unique: true, name: "unique_subdomains"}

      t.timestamps
    end
  end
end
