class CreateCompanyPerks < ActiveRecord::Migration[6.0]
  def change
    create_table :company_perks do |t|
      t.references :company, null: false, foreign_key: true
      t.references :perk, null: false, foreign_key: true

      t.timestamps
    end
  end
end
