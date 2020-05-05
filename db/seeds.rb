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

request_type_list.each do |description, request_type_hash|
  p = RequestType.new
  p.description = description
  p.save
end