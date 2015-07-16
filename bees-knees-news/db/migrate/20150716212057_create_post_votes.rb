class CreatePostVotes < ActiveRecord::Migration
  def change
    create_table :post_votes do |t|
      t.integer  :post_id, null: false
      t.integer :user_id, null: false
      t.boolean :upvote,  null: false, default: true

      t.timestamps null: false
    end
  end
end
