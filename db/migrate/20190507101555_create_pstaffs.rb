class CreatePstaffs < ActiveRecord::Migration[5.2]
  def change
    create_table :pstaffs do |t|
      t.string :name
      t.string :gender
      t.string :mobile_no
      t.string :department
      t.string :address
      t.string :vehical_type
      t.attachment :registration_certificate
      t.attachment :aadhaar_card

      t.timestamps
    end
  end
end
