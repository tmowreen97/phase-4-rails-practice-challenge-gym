class GymsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

  def show
    gym = Gym.find(params[:id])
    render json: gym, status: :ok
  end

  def destroy
    gym = Gym.find(params[:id])
    gym.destroy
    head :no_content
  end

  def create
    gym = Gym.create!(gym_params)
    render json: gym, status: :created
  end


  private

  def render_not_found_response
    render json: {error: "not found"}, status: :not_found
  end

  def render_unprocessable_entity invalid
    render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
  end

  def gym_params
    params.permit(:name, :address)
  end
end
