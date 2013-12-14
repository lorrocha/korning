class AddUniqueProductId < ActiveRecord::Migration
  def up
    Sale.all.each do |sale|
      product = sale.product_name
      Product.find_or_initialize_by(name: product) do |prod|
        prod.name = product
        prod.save!
      end
      puts "#{product} has been added."
    end
  end

  def down
    Product.destroy_all
  end
end
