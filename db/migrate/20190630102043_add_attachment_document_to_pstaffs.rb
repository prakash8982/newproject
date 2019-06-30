class AddAttachmentDocumentToPstaffs < ActiveRecord::Migration[5.2]
  def self.up
    change_table :pstaffs do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :pstaffs, :document
  end
end
