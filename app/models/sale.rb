class Sale < ActiveRecord::Base
  belongs_to :employee
  belongs_to :customer
  belongs_to :product


  def self.fifteen_months
    Sale.where("sale_date > ?", 15.months.ago).order("sale_date DESC", :invoice_no)
  end

  def calculate_per_unit
    (self.sale_amount/self.units_sold).round(2)
  end
end
