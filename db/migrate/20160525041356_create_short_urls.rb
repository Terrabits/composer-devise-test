class CreateShortUrls < ActiveRecord::Migration
  def change
    create_table :short_urls do |t|
      t.string :url
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :short_urls, [:user_id, :created_at]
  end
end
