class AddJobExpirationDateToJobs < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :job_expiration_date, :string
  end
end
