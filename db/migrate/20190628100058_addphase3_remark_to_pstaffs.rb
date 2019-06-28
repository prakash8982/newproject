class Addphase3RemarkToPstaffs < ActiveRecord::Migration[5.2]
  def change
  	add_column :pstaffs, :phase3_remark, :string ,default:"NA"
  end
end
