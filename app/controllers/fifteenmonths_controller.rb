class FifteenmonthsController < ApplicationController

  def index
    @fifteen = Sale.fifteen_months
  end

  def show
    @fifteen_1 = Sale.find(params[:id])
  end
end
