class AddIconToPerks < ActiveRecord::Migration[6.0]
  def change
   add_column :perks, :icon, :string
  end
end
