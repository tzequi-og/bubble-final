class MovieGenresController < ApplicationController
  def index
    matching_movie_genres = MovieGenre.all

    @list_of_movie_genres = matching_movie_genres.order({ :created_at => :desc })

    render({ :template => "movie_genres/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movie_genres = MovieGenre.where({ :id => the_id })

    @the_movie_genre = matching_movie_genres.at(0)

    render({ :template => "movie_genres/show" })
  end

  def create
    the_movie_genre = MovieGenre.new
    the_movie_genre.name = params.fetch("query_name")

    if the_movie_genre.valid?
      the_movie_genre.save
      redirect_to("/movie_genres", { :notice => "Movie genre created successfully." })
    else
      redirect_to("/movie_genres", { :alert => the_movie_genre.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_movie_genre = MovieGenre.where({ :id => the_id }).at(0)

    the_movie_genre.name = params.fetch("query_name")

    if the_movie_genre.valid?
      the_movie_genre.save
      redirect_to("/movie_genres/#{the_movie_genre.id}", { :notice => "Movie genre updated successfully."} )
    else
      redirect_to("/movie_genres/#{the_movie_genre.id}", { :alert => the_movie_genre.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_movie_genre = MovieGenre.where({ :id => the_id }).at(0)

    the_movie_genre.destroy

    redirect_to("/movie_genres", { :notice => "Movie genre deleted successfully."} )
  end
end
