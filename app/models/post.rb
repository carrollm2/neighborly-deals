class Post < ActiveRecord::Base

  belongs_to :user
  belongs_to :category
  belongs_to :post_type

end