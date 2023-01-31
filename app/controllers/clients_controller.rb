class ClientsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
rescue_from ActiveRecord::RecordInvalid, with: :render_not_found_response

  def show
    client = Client.find(params[:id])
    render json: client, status: :ok
  end


  private

  def render_not_found_response
    render json: {error: "not found"}, status: :not_found
  end

  def render_unprocessable_entity_response invalid
    render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
  end


end
