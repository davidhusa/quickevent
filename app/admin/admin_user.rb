ActiveAdmin.register AdminUser do     
  index do                            
    column :email
    column :event_id               
    column :current_sign_in_at        
    column :last_sign_in_at           
    column :sign_in_count             
    default_actions                   
  end                                 

  filter :email                       

  form do |f|                         
    f.inputs "Admin Details" do       
      f.input :email                  
      f.input :password               
      f.input :password_confirmation
      f.input :event
    end                               
    f.actions                         
  end                                 
end                                   
