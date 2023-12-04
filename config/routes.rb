Rails.application.routes.draw do
  # Routes for the Movie genre association resource:

  # CREATE
  post("/insert_movie_genre_association", { :controller => "movie_genre_associations", :action => "create" })
          
  # READ
  get("/movie_genre_associations", { :controller => "movie_genre_associations", :action => "index" })
  
  get("/movie_genre_associations/:path_id", { :controller => "movie_genre_associations", :action => "show" })
  
  # UPDATE
  
  post("/modify_movie_genre_association/:path_id", { :controller => "movie_genre_associations", :action => "update" })
  
  # DELETE
  get("/delete_movie_genre_association/:path_id", { :controller => "movie_genre_associations", :action => "destroy" })

  #------------------------------

  # Routes for the Movie genre resource:

  # CREATE
  post("/insert_movie_genre", { :controller => "movie_genres", :action => "create" })
          
  # READ
  get("/movie_genres", { :controller => "movie_genres", :action => "index" })
  
  get("/movie_genres/:path_id", { :controller => "movie_genres", :action => "show" })
  
  # UPDATE
  
  post("/modify_movie_genre/:path_id", { :controller => "movie_genres", :action => "update" })
  
  # DELETE
  get("/delete_movie_genre/:path_id", { :controller => "movie_genres", :action => "destroy" })

  #------------------------------

  # Routes for the Movie genre tag resource:

  # CREATE
  post("/insert_movie_genre_tag", { :controller => "movie_genre_tags", :action => "create" })
          
  # READ
  get("/movie_genre_tags", { :controller => "movie_genre_tags", :action => "index" })
  
  get("/movie_genre_tags/:path_id", { :controller => "movie_genre_tags", :action => "show" })
  
  # UPDATE
  
  post("/modify_movie_genre_tag/:path_id", { :controller => "movie_genre_tags", :action => "update" })
  
  # DELETE
  get("/delete_movie_genre_tag/:path_id", { :controller => "movie_genre_tags", :action => "destroy" })

  #------------------------------

  # Routes for the Director resource:

  # CREATE
  post("/insert_director", { :controller => "directors", :action => "create" })
          
  # READ
  get("/directors", { :controller => "directors", :action => "index" })
  
  get("/directors/:path_id", { :controller => "directors", :action => "show" })
  
  # UPDATE
  
  post("/modify_director/:path_id", { :controller => "directors", :action => "update" })
  
  # DELETE
  get("/delete_director/:path_id", { :controller => "directors", :action => "destroy" })

  #------------------------------

  # Routes for the Movie resource:

  # CREATE
  post("/insert_movie", { :controller => "movies", :action => "create" })
          
  # READ
  get("/movies", { :controller => "movies", :action => "index" })
  
  get("/movies/:path_id", { :controller => "movies", :action => "show" })
  
  # UPDATE
  
  post("/modify_movie/:path_id", { :controller => "movies", :action => "update" })
  
  # DELETE
  get("/delete_movie/:path_id", { :controller => "movies", :action => "destroy" })

  #------------------------------

  # Routes for the Movie rating resource:

  # CREATE
  post("/insert_movie_rating", { :controller => "movie_ratings", :action => "create" })
          
  # READ
  get("/movie_ratings", { :controller => "movie_ratings", :action => "index" })
  
  get("/movie_ratings/:path_id", { :controller => "movie_ratings", :action => "show" })
  
  # UPDATE
  
  post("/modify_movie_rating/:path_id", { :controller => "movie_ratings", :action => "update" })
  
  # DELETE
  get("/delete_movie_rating/:path_id", { :controller => "movie_ratings", :action => "destroy" })

  #------------------------------

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
