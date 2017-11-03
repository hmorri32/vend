class MachinesController < ApplicationController
  def index
    @owner = Owner.find(params[:owner_id])
  end

  def show
    @machine       = Machine.find(params[:id])
    @yung_snacks   = @machine.snacks
    @average_price = @yung_snacks.average(:price)

  end
end
