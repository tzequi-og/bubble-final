class MovieRatingsController < ApplicationController
  def index
    matching_movie_ratings = MovieRating.all

    @list_of_movie_ratings = matching_movie_ratings.order({ :created_at => :desc })

    render({ :template => "movie_ratings/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movie_ratings = MovieRating.where({ :id => the_id })

    @the_movie_rating = matching_movie_ratings.at(0)

    render({ :template => "movie_ratings/show" })
  end

  def create
    the_movie_rating = MovieRating.new
    the_movie_rating.user_id = params.fetch("query_user_id")
    the_movie_rating.movie_id = params.fetch("query_movie_id")
    the_movie_rating.rating = params.fetch("query_rating")

    if the_movie_rating.valid?
      the_movie_rating.save
      redirect_to("/movie_ratings", { :notice => "Movie rating created successfully." })
    else
      redirect_to("/movie_ratings", { :alert => the_movie_rating.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_movie_rating = MovieRating.where({ :id => the_id }).at(0)

    the_movie_rating.user_id = params.fetch("query_user_id")
    the_movie_rating.movie_id = params.fetch("query_movie_id")
    the_movie_rating.rating = params.fetch("query_rating")

    if the_movie_rating.valid?
      the_movie_rating.save
      redirect_to("/movie_ratings/#{the_movie_rating.id}", { :notice => "Movie rating updated successfully."} )
    else
      redirect_to("/movie_ratings/#{the_movie_rating.id}", { :alert => the_movie_rating.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_movie_rating = MovieRating.where({ :id => the_id }).at(0)

    the_movie_rating.destroy

    redirect_to("/movie_ratings", { :notice => "Movie rating deleted successfully."} )
  end
end
