class AddUniqueCustomers < ActiveRecord::Migration

  def strip_paren(string)
    string.delete('()')
  end

  def up
    Sale.all.each do |sale|
      customer = strip_paren(sale.customer_and_account_no)
      customer = customer.split(' ')
      Customer.find_or_initialize_by(name: customer[0]) do |cust|
        cust.name = customer[0]
        cust.account_no = customer[1]
        cust.email = 'www.' + customer[0] + '.com'
        cust.save!
      end
      puts "#{customer} has been added."
    end
  end

  def down
    Customer.destroy_all
  end
end
