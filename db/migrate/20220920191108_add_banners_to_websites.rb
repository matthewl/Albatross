class AddBannersToWebsites < ActiveRecord::Migration[7.0]
  def change
    add_column :websites, :banner_text, :string, default: ""
    add_column :websites, :banner_enabled, :boolean, default: false
  end
end
