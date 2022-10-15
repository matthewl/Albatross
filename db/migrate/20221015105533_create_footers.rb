class CreateFooters < ActiveRecord::Migration[7.0]
  def change
    create_table :footers do |t|
      t.references :website, null: false, foreign_key: true
      t.boolean :display_address, default: false
      t.boolean :display_copyright, default: true
      t.timestamps
    end
  end
end
