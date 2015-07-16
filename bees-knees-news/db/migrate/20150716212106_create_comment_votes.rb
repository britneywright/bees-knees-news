class CreateCommentVotes < ActiveRecord::Migration
  def change
    create_table :comment_votes do |t|
      t.integer  :comment_id, null: false
      t.integer :user_id, null: false
      t.boolean :upvote,  null: false, default: true

      t.timestamps null: false
    end
  end
end
