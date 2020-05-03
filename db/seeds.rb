# users_list = {
#     "Bart Simpspon" => {
#       :username => "bsimpson",
#       :email => "bsimpson@spfld.com",
#       :password => "donthaveacowman"
#     }
# }


# users_list.each do |name, user_hash|
#   User.create(user_hash)
# end

category_list = {
    "grocery" => {
    },
    "fitness" => {
    },
    "automotive" => {
    },
    "other" => { 
    }
  }

category_list.each do |name, category_hash|
  p = Category.new
  p.name = name
  p.save
end


request_type_list = {
    "request" => {
    },
    "give away" => {
    }
  }

request_type_list.each do |type, request_type_hash|
  p = RequestType.new
  p.request_type = type
  p.save
end