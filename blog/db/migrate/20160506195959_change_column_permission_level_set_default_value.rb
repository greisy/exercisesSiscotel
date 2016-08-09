class ChangeColumnPermissionLevelSetDefaultValue < ActiveRecord::Migration
  def change
  	remove_column :users, :permission_level, :integer, default: 1
  end
end
