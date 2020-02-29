class CreateCandidates < ActiveRecord::Migration[6.0]
  def change
    create_table :candidates do |t|
      t.string :full_name
      t.string :email
      t.string :mobile_number
      t.references :job, null: false, foreign_key: true

      t.timestamps
    end
  end
end
