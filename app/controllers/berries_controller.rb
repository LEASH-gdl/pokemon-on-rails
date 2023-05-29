class BerriesController < ApplicationController

  before_action :authenticate_user!

  def index
    @berries = Item.find_by(name: "berries", user: @current_user).amount
  end

  def new
    @lotteryOptions = [0, 0, 0, 1, 1, 2, 2, 5, 10, 15]
    @berries = Item.find_by(name: "berries", user: @current_user)
    @numberChosen = @lotteryOptions.sample
    @berries.amount += @numberChosen
    @berries.save

    redirect_to :berries
  end

end
