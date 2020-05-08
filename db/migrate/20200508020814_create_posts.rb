class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :category
      t.string :description
      t.string :rtype
      t.integer :user_id
    end
  end
end
