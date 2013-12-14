class CustomersController < ApplicationController
  require_relative 'sales_controller'

  def index
    @sales = Sale.all.order(:id)
  end

  def show
    @sale = Sale.find(params[:id])
  end
end
