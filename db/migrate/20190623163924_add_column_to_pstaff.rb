class AddColumnToPstaff < ActiveRecord::Migration[5.2]
  def change
    add_column :pstaffs, :disapprove, :boolean,default:false
    add_column :pstaffs, :phase1, :boolean,default:false
    add_column :pstaffs, :phase2, :boolean,default:false
    add_column :pstaffs, :phase3, :boolean,default:false
    add_column  :pstaffs,:type_applicant, :string
    add_column :pstaffs, :vichel_no, :string
    add_column :pstaffs, :vichel_model, :string
    add_column :pstaffs, :unique_id, :string
    add_column :pstaffs, :RC_holder_name, :string
    add_column :pstaffs, :relationship, :string

    add_column :pstaffs, :phase1_remark, :string, default:"NA"
    add_column :pstaffs, :phase2_remark, :string ,default:"NA"
  end
end
