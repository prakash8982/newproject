class AddUserIdToPstaffs < ActiveRecord::Migration[5.2]
  def change
    add_column :pstaffs, :user_id, :integer
  end
end
