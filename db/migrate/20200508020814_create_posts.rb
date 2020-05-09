class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :description
      t.string :rtype
      t.integer :user_id
      t.integer :category_id
    end
  end
end
