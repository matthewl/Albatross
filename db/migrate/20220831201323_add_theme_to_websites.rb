class AddThemeToWebsites < ActiveRecord::Migration[7.0]
  def change
    add_column :websites, :theme, :string, default: ""
  end
end
