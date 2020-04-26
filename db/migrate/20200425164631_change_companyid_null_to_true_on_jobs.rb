class ChangeCompanyidNullToTrueOnJobs < ActiveRecord::Migration[6.0]
  def change
    change_column_null :jobs, :company_id, true
  end
end
