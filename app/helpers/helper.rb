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
  
  
  def self.is_valid_edit_form?(p)
    p.category_id != "" && p.description != "" && p.post_type_id != ""
  end    

end