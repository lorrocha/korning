class PopulateEmployeeField < ActiveRecord::Migration

  def up
    Sale.all.each do |sale|
      full_emp = sale.employee.split(' ')
      first_n = full_emp[0]
      last_n = full_emp[1]
      email_n = full_emp[2].delete('()')
      Employee.find_or_initialize_by(last_name: last_n) do |emp|
        emp.first_name = first_n
        emp.last_name = last_n
        emp.email = email_n
        emp.save!
      end
      puts "Employee initialized as #{last_n},#{first_n} : #{email_n}"
    end
  end

  def down
    Employee.destroy_all
  end
end
