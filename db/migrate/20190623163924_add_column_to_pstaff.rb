class AddColumnToPstaff < ActiveRecord::Migration[5.2]
  def change
    add_column :pstaffs, :disapprove, :boolean,default:false
    add_column :pstaffs, :phase1_remark, :string, default:"NA"
    add_column :pstaffs, :phase2_remark, :string ,default:"NA"
  end
end
