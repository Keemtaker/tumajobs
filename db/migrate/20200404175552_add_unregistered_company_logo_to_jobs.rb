class AddUnregisteredCompanyLogoToJobs < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :unregistered_company_logo, :string
  end
end
