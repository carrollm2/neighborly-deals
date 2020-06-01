category_list = {
    "furniture" => {
    },
    "fitness" => {
    },
    "automotive" => {
    },
    "children toys" => {
    },   
    "entertainment" => {
    },  
    "books" => {
    },    
    "clothes" => {
    }, 
    "sports equipment" => {
    },       
    "other" => { 
    }
  }

category_list.each do |name, category_hash|
  p = Category.new
  p.name = name
  p.save
end


post_type_list = {
    "request" => {
    },
    "give away" => {
    }
  }

post_type_list.each do |description, post_type_hash|
  p = PostType.new
  p.description = description
  p.save
end