class ChangeUserIdToAdminUserId < ActiveRecord::Migration
  def change
    rename_column :characters, :user_id, :admin_user_id
  end
end
