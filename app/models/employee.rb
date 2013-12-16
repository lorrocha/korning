class Employee < ActiveRecord::Base
  has_many :sales

  def report
    self.sales.order("sale_amount DESC")
  end
end
