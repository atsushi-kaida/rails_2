class AddIconNameToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :icon_name, :string
  end
end
