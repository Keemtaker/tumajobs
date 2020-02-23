class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :role
      t.text :description
      t.string :job_type
      t.string :keywords
      t.string :salary
      t.string :location
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
