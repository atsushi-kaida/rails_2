class RemoveIconNameFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :icon_name, :string
  end
end
