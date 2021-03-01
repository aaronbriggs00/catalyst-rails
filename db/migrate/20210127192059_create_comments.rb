class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :value
      t.integer :parent_id
      t.timestamps
    end
  end
end
