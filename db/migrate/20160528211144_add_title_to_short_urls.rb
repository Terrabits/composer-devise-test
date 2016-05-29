class AddTitleToShortUrls < ActiveRecord::Migration
  def change
    add_column :short_urls, :title, :string
  end
end
