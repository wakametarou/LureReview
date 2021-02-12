class LuresController < ApplicationController
  def index
    @lures = Lure.all
  end

  def show
    @lure = Lure.find(params[:id])
    @review = Review.new
  end
end
