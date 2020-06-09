class Helpers
  
  def self.current_user(session)
    user = User.find(session[:user_id])
  end


  def self.is_logged_in?(session)
    !!session[:user_id]
  end
  
  
  def self.is_valid_new_form?(params)
    valid_fields = ["category", "description", "post_type"]
    
    valid_fields.each do | field |
      if params[field].presence == false || params.keys.include?(field) == false
        return false
      end
    end
    
    if params["description"].empty?
      return false
    end
    
    return true
  end  
  
  
  def self.is_valid_edit_form?(params)
    if params["post"]["description"].empty?
      return false
    end 
      
    params["post"]["category_id"].presence && params["post"]["description"].presence && params["post_type"]["id"].presence  
  end    

end