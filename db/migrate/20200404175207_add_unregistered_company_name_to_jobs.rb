class AddUnregisteredCompanyNameToJobs < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :unregistered_company_name, :string
  end
end
