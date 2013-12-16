class EmployeeprofileController < ApplicationController

  def index
    @employees_profiles = Employee.all
  end

  def show
    @employee_report = Employee.find(params[:id])
  end
end
