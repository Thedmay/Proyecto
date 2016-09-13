class AddColumnPermissionLevelToUsuario < ActiveRecord::Migration
  def change
  	add_column :usuarios, :permission_level, :integer
  end
end
