Rails.application.routes.draw do
  devise_for :users
  # Routes for the Delivery resource:

  # CREATE

  root to: "deliveries#index"
  
  post("/insert_delivery", { :controller => "deliveries", :action => "create" })
          
  # READ
  get("/deliveries", { :controller => "deliveries", :action => "index" })
  
  get("/deliveries/:path_id", { :controller => "deliveries", :action => "show" })
  
  # UPDATE
  
  post("/modify_delivery/:path_id", { :controller => "deliveries", :action => "update" })
  
  # DELETE
  get("/delete_delivery/:path_id", { :controller => "deliveries", :action => "destroy" })

  #------------------------------

  # Routes for the Tracker resource:

  # get("/", { :controller => "trackers", :action => "index" })


  #------------------------------

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
