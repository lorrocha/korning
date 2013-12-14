class AddColumnProductId < ActiveRecord::Migration
  def up
    add_column :sales, :product_id, :integer

    Product.all.each do |product|
      prod_name = product.name
      Sale.all.each do |sale|
        sale_prod = sale.product_name
        if prod_name == sale_prod
          sale.product_id = product.id
        end
        sale.save!
      end
    end
  end

  def down
    remove_column :sales, :product_id
  end
end
