class SnacksController < ApplicationController
  def show
    @snack = Snack.find(params[:id])
    @machine_average = @snack.machine.snacks.average(:price)
  end
end