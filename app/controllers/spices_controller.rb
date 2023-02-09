class SpicesController < ApplicationController
  before_action :find_spice, only: [:update, :destroy]
  
  def index
    render json: Spice.all
  end

  def create
    spice = Spice.create(spice_params)
    render json: spice, status: :created
  end

  def update
    @spice.update(spice_params)
    render json: @spice
  end

  def destroy
    @spice.destroy
  end
  
  def spice_params
    params.permit(:title, :image, :description, :notes, :rating)
  end

  def find_spice
   @spice = Spice.find_by_id(params[:id])
  end
end
