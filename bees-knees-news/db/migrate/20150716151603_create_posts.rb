class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string  :title,   null: false
      t.string  :link,    null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
