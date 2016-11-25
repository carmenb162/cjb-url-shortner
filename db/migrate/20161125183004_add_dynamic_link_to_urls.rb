class AddDynamicLinkToUrls < ActiveRecord::Migration[5.0]
  def change
    add_column :urls, :dynamic_link, :string
  end
end
