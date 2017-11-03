class SnacksController < ApplicationController
  def show
    @snack = Snack.find_by(params[:id])
  end
end