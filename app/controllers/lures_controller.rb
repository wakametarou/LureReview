class LuresController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def index
    @lures = Lure.all
  end

  def show
    @lure = Lure.find(params[:id])
    @review = Review.new
  end
end
