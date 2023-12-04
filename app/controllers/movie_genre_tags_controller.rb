class MovieGenreTagsController < ApplicationController
  def index
    matching_movie_genre_tags = MovieGenreTag.all

    @list_of_movie_genre_tags = matching_movie_genre_tags.order({ :created_at => :desc })

    render({ :template => "movie_genre_tags/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movie_genre_tags = MovieGenreTag.where({ :id => the_id })

    @the_movie_genre_tag = matching_movie_genre_tags.at(0)

    render({ :template => "movie_genre_tags/show" })
  end

  def create
    the_movie_genre_tag = MovieGenreTag.new
    the_movie_genre_tag.genre_id = params.fetch("query_genre_id")
    the_movie_genre_tag.movie_id = params.fetch("query_movie_id")

    if the_movie_genre_tag.valid?
      the_movie_genre_tag.save
      redirect_to("/movie_genre_tags", { :notice => "Movie genre tag created successfully." })
    else
      redirect_to("/movie_genre_tags", { :alert => the_movie_genre_tag.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_movie_genre_tag = MovieGenreTag.where({ :id => the_id }).at(0)

    the_movie_genre_tag.genre_id = params.fetch("query_genre_id")
    the_movie_genre_tag.movie_id = params.fetch("query_movie_id")

    if the_movie_genre_tag.valid?
      the_movie_genre_tag.save
      redirect_to("/movie_genre_tags/#{the_movie_genre_tag.id}", { :notice => "Movie genre tag updated successfully."} )
    else
      redirect_to("/movie_genre_tags/#{the_movie_genre_tag.id}", { :alert => the_movie_genre_tag.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_movie_genre_tag = MovieGenreTag.where({ :id => the_id }).at(0)

    the_movie_genre_tag.destroy

    redirect_to("/movie_genre_tags", { :notice => "Movie genre tag deleted successfully."} )
  end
end
