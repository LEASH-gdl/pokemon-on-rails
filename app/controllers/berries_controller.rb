class BerriesController < ApplicationController

  def index
    @berries = Item.find_by(name: "berries").amount
  end

  def new
    lotteryOptions = [0, 0, 0, 1, 1, 2, 2, 5, 10, 15]
    berries = Item.find_by(name: "berries")
    berries.amount += lotteryOptions.sample
    berries.save

    redirect_to :berries
  end

end