class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.actors.names.include?(params[:actor_name])
      redirect_to "/movies/#{@movie.id}"
    end
  end
end