class AddTransactionReferenceToJobs < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :transaction_reference, :string
    add_column :jobs, :payment_completed, :boolean, default: false
  end
end
