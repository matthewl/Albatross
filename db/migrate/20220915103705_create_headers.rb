class CreateHeaders < ActiveRecord::Migration[7.0]
  def change
    create_table :headers do |t|
      t.references :website, null: false, foreign_key: true
      t.string :title
      t.string :welcome
      t.string :sub_title
      t.timestamps
    end
  end
end
