class SquaresController < ApplicationController
  before_action :authenticate_user!
  before_action :squares_set


  def index
    @square = @squares.last
    redirect_to action: 'new' if @square.nil?
  end

  def new
    @square = Square.new
  end

  def create
    @square = Square.new(square_params)
    if @square.save
      redirect_to "/squares/#{@square.id}"
    else
      render :new
    end
  end

  def edit
    @square = Square.find(params[:id])
  end

  def update
    @square = Square.find(params[:id])
    if @square.update(square_params)
      redirect_to "/squares/#{params[:id]}"
    else
      render :edit
    end
  end

  def destroy
    square = Square.find(params[:id])
    if current_user.id == square.user_id
      square.destroy
      redirect_to squares_path
    else
      redirect_to root_path
    end
  end

  def show
    @square = Square.find(params[:id])
  end

  private
  def squares_set
    @squares = Square.where(user_id: current_user.id).order("updated_at DESC")
  end

  def square_params
    params.require(:square).permit(:name,:zero,:one, :two, :three, :four, :five, :six, :seven, :eight,:one_one, :one_two, :one_three, :one_four, :one_five, :one_six, :one_seven, :one_eight, :two_one, :two_two, :two_three, :two_four, :two_five, :two_six, :two_seven, :two_eight, :three_one, :three_two, :three_three, :three_four, :three_five, :three_six, :three_seven, :three_eight, :four_one, :four_two, :four_three, :four_four, :four_five, :four_six, :four_seven, :four_eight, :zero, :five_one, :five_two, :five_three, :five_four, :five_five, :five_six, :five_seven, :five_eight, :six_one, :six_two, :six_three, :six_four, :six_five, :six_six, :six_seven, :six_eight, :seven_one, :seven_two, :seven_three, :seven_four, :seven_five, :seven_six, :seven_seven, :seven_eight, :eight_one, :eight_two, :eight_three, :eight_four, :eight_five, :eight_six, :eight_seven, :eight_eight,).merge(id: params[:id],user_id: current_user.id)
  end
end
