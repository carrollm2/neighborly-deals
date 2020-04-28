class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :category
      t.string :description
      t.string :rtype
      t.integer :user_id
    end
  end
end
