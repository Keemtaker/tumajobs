class CreateTalents < ActiveRecord::Migration[6.0]
  def change
    create_table :talents do |t|
      t.string :full_name
      t.string :email
      t.string :mobile_number
      t.string :resume
      t.string :cover_letter
      t.references :job, null: false, foreign_key: true

      t.timestamps
    end
  end
end
