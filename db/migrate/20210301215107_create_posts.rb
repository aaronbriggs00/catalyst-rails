class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.integer :user_id
      t.string :hyperlink
      t.text :text
      t.string :image_url

      t.timestamps
    end
  end
end
