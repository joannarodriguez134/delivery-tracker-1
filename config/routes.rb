Rails.application.routes.draw do
  # Routes for the Tracker resource:

  # get("/", { :controller => "trackers", :action => "index" })
  root to: "trackers#index"

  # CREATE
  post("/insert_tracker", { :controller => "trackers", :action => "create" })
          
  # READ
  get("/trackers", { :controller => "trackers", :action => "index" })
  
  get("/trackers/:path_id", { :controller => "trackers", :action => "show" })
  
  # UPDATE
  
  post("/modify_tracker/:path_id", { :controller => "trackers", :action => "update" })
  
  # DELETE
  get("/delete_tracker/:path_id", { :controller => "trackers", :action => "destroy" })

  #------------------------------

  # Routes for the User resource:

  # CREATE
  post("/insert_user", { :controller => "users", :action => "create" })
          
  # READ
  get("/users", { :controller => "users", :action => "index" })
  
  get("/users/:path_id", { :controller => "users", :action => "show" })
  
  # UPDATE
  
  post("/modify_user/:path_id", { :controller => "users", :action => "update" })
  
  # DELETE
  get("/delete_user/:path_id", { :controller => "users", :action => "destroy" })

  #------------------------------

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
