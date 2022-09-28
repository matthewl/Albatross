class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :website, null: false, foreign_key: true
      t.string :title
      t.string :status, default: "draft"
      t.string :slug
      t.timestamps
    end
  end
end
