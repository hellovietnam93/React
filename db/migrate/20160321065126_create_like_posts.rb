class CreateLikePosts < ActiveRecord::Migration
  def change
    create_table :like_posts do |t|
      t.references :user, index: true, foreign_key: true
      t.references :post, index: true, foreign_key: true

      t.timestamps null: false
    end

    add_index :like_posts, [:user_id, :post_id], unique: true
  end
end
