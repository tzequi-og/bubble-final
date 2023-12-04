Rails.application.routes.draw do
  # Routes for the Bubble resource:

  # CREATE
  post("/insert_bubble", { :controller => "bubbles", :action => "create" })
          
  # READ
  get("/bubbles", { :controller => "bubbles", :action => "index" })
  
  get("/bubbles/:path_id", { :controller => "bubbles", :action => "show" })
  
  # UPDATE
  
  post("/modify_bubble/:path_id", { :controller => "bubbles", :action => "update" })
  
  # DELETE
  get("/delete_bubble/:path_id", { :controller => "bubbles", :action => "destroy" })

  #------------------------------

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
