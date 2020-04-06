class AddJobEmailToJobs < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :job_email, :string
  end
end
