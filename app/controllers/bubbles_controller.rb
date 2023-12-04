class BubblesController < ApplicationController
  def index
    matching_bubbles = Bubble.all

    @list_of_bubbles = matching_bubbles.order({ :created_at => :desc })

    render({ :template => "bubbles/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_bubbles = Bubble.where({ :id => the_id })

    @the_bubble = matching_bubbles.at(0)

    render({ :template => "bubbles/show" })
  end

  def create
    the_bubble = Bubble.new
    the_bubble.user1_id = params.fetch("query_user1_id")
    the_bubble.user2_id = params.fetch("query_user2_id")
    the_bubble.similarity_score = params.fetch("query_similarity_score")

    if the_bubble.valid?
      the_bubble.save
      redirect_to("/bubbles", { :notice => "Bubble created successfully." })
    else
      redirect_to("/bubbles", { :alert => the_bubble.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_bubble = Bubble.where({ :id => the_id }).at(0)

    the_bubble.user1_id = params.fetch("query_user1_id")
    the_bubble.user2_id = params.fetch("query_user2_id")
    the_bubble.similarity_score = params.fetch("query_similarity_score")

    if the_bubble.valid?
      the_bubble.save
      redirect_to("/bubbles/#{the_bubble.id}", { :notice => "Bubble updated successfully."} )
    else
      redirect_to("/bubbles/#{the_bubble.id}", { :alert => the_bubble.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_bubble = Bubble.where({ :id => the_id }).at(0)

    the_bubble.destroy

    redirect_to("/bubbles", { :notice => "Bubble deleted successfully."} )
  end
end
