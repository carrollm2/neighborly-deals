class User < ActiveRecord::Base

  has_secure_password
  
  has_many :requests
  belongs_to :neighborhood

  def slug
    self.username.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    name = slug.gsub("-"," ")
    User.find_by(username: name)
  end

end