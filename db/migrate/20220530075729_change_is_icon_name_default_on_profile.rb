class ChangeIsIconNameDefaultOnProfile < ActiveRecord::Migration[7.0]
  def change
    change_column_default :profiles, :icon_name, from: nil, to: 'default_icon.jpeg'
  end
end
