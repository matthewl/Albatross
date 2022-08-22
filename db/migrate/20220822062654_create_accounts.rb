class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto'

    create_table :accounts do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
