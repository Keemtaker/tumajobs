class CreateJobPerks < ActiveRecord::Migration[6.0]
  def change
    create_table :job_perks do |t|
      t.references :job, null: false, foreign_key: true
      t.references :perk, null: false, foreign_key: true

      t.timestamps
    end
  end
end
