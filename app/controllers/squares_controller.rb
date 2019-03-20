class SquaresController < ApplicationController

  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destory
  end

  def show
    @square = Square.find(1)
    @squares = Square.all
  end

  private
  def square_params
    params.require(:square).permit(:nickname, :rate, :review).merge(product_id: params[:product_id])
  end

end
