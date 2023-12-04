class MovieGenreAssociationsController < ApplicationController
  def index
    matching_movie_genre_associations = MovieGenreAssociation.all

    @list_of_movie_genre_associations = matching_movie_genre_associations.order({ :created_at => :desc })

    render({ :template => "movie_genre_associations/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movie_genre_associations = MovieGenreAssociation.where({ :id => the_id })

    @the_movie_genre_association = matching_movie_genre_associations.at(0)

    render({ :template => "movie_genre_associations/show" })
  end

  def create
    the_movie_genre_association = MovieGenreAssociation.new
    the_movie_genre_association.user_id = params.fetch("query_user_id")
    the_movie_genre_association.genre_id = params.fetch("query_genre_id")
    the_movie_genre_association.status = params.fetch("query_status")

    if the_movie_genre_association.valid?
      the_movie_genre_association.save
      redirect_to("/movie_genre_associations", { :notice => "Movie genre association created successfully." })
    else
      redirect_to("/movie_genre_associations", { :alert => the_movie_genre_association.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_movie_genre_association = MovieGenreAssociation.where({ :id => the_id }).at(0)

    the_movie_genre_association.user_id = params.fetch("query_user_id")
    the_movie_genre_association.genre_id = params.fetch("query_genre_id")
    the_movie_genre_association.status = params.fetch("query_status")

    if the_movie_genre_association.valid?
      the_movie_genre_association.save
      redirect_to("/movie_genre_associations/#{the_movie_genre_association.id}", { :notice => "Movie genre association updated successfully."} )
    else
      redirect_to("/movie_genre_associations/#{the_movie_genre_association.id}", { :alert => the_movie_genre_association.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_movie_genre_association = MovieGenreAssociation.where({ :id => the_id }).at(0)

    the_movie_genre_association.destroy

    redirect_to("/movie_genre_associations", { :notice => "Movie genre association deleted successfully."} )
  end
end
