class AddEmployeeIdToSales < ActiveRecord::Migration
  def up
    Employee.all.each do |employee|
      f_name = employee.first_name
      Sale.all.each do |sale|
        first_name = sale.employee.split(' ')
        first_name = first_name[0]
        if f_name == first_name
          sale.employee_id = employee.id
        end
        sale.save!
      end
    end
  end

  def down
    Sale.update_all(employee_id: nil)
  end
end
