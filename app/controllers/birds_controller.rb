class BirdsController < ApplicationController

  # find the bird that matches the ID from the route params
    # update the bird using the params from the body of the request
  #PATCH /birds/:id

def update
  bird = Bird.find_by(id: params[:id])
  if bird
    bird.update(bird_params)
    render json: bird
    
  else
    
    render json: { error: "Bird not found"}, status: :not_found
    end
  end
  

  #do the work of calculating the number of likes and incrementing it. custom route
  def increment_likes
    bird = Bird.find_by(id: params[:id])
    if bird
      bird.update(likes: bird.likes + 1)
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end



  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end

  # POST /birds
  def create
    bird = Bird.create(bird_params)
    render json: bird, status: :created
  end

  # GET /birds/:id
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end

  private

  def bird_params
    params.permit(:name, :species)
  end

end
