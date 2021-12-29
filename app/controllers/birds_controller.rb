class BirdsController < ApplicationController
  def index
    @birds = Bird.all
    render json: @birds, only: [:id, :name, :species]
  end

  def show
    bird = Bird.find_by(id: params[:id])
    if bird 
      # Bird.find_by(id: params[:id])
      render json: bird.slice(:id, :name, :species)
    else
      render json: {message: 'Bird noy found.'}
    end
  end
end