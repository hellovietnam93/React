class CreateLikeComments < ActiveRecord::Migration
  def change
    create_table :like_comments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :comment, index: true, foreign_key: true

      t.timestamps null: false
    end

    add_index :like_comments, [:user_id, :comment_id], unique: true
  end
end
