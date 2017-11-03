class SnacksController < ApplicationController
  def show
    @snack = Snack.find_by(params[:snack_title])
  end
end