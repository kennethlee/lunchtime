class SuggestionsController < ApplicationController

  def index
    @suggestions = Suggestion.all
  end

  def new
    @suggestion = Suggestion.new
  end

  # Saves new suggestion
  def create
    @suggestion = Suggestion.new(suggestion_params)
    if @suggestion.save
    redirect_to suggestions_path
    else
    render 'new'
    end
  end

  def show
  end

  # Destroys a submitted suggestion
  def destroy
    @suggestion.destroy
    flash[:success] = "The suggestion has been deleted."
    redirect_to root_url
  end

  def upvote
    @suggestion = Suggestion.find(params[:id])
    @suggestion.liked_by current_user
    redirect_to suggestions_path
  end

  def unvote
    @suggestion = Suggestion.find(params[:id])
    @suggestion.unliked_by current_user
    redirect_to suggestions_path
  end

  private

    def suggestion_params
      params.require(:suggestion).permit(:name, :user_id, :user_name)
    end
end
