class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :admin, :boolean ,default:false
    add_column :users, :phase1, :boolean,default:false
    add_column :users, :phase2, :boolean,default:false
    add_column :users, :phase3, :boolean,default:false
    add_column :users, :role, :string,default: 'none'
  end
end
