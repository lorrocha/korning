class ThreemonthsController < ApplicationController

  def index
    cutoff_date = Time.now - 15.months
    @three_months = Sale.where("sale_date >= ?", cutoff_date).order("sale_date DESC", :id)
  end

  def show
    @three_months_single = Sale.find(params[:id])
  end
end
