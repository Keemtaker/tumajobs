class AddJobApplicationTypeToJobs < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :job_application_type, :string
  end
end
