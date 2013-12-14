class AddCustomerIdToSales < ActiveRecord::Migration
  def up
    Customer.all.each do |customer|
      cust_name = customer.name
      Sale.all.each do |sale|
        first_name = sale.customer_and_account_no.split(' ')
        first_name = first_name[0]
        if cust_name == first_name
          sale.customer_id = customer.id
        end
        sale.save!
      end
    end
  end

  def down
    Sale.update_all(customer_id: nil)
  end
end
