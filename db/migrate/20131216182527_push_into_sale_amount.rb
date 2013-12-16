require 'CSV'

class PushIntoSaleAmount < ActiveRecord::Migration
  def up
    datafile = Rails.root + 'db/data/sales.csv'

    CSV.foreach(datafile, headers: true) do |row|
      Sale.connection.execute("UPDATE sales SET sale_amount = #{row['sale_amount'].delete('$')} WHERE invoice_no = '#{row['invoice_no']}'")
    end
  end

  def down
    Sale.all do |sale|
      sale.update(:sale_amount,0)
      sale.save!
    end
  end

end
