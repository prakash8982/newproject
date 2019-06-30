class RemoveDocumentFromPstaff < ActiveRecord::Migration[5.2]
  def change
    remove_column :pstaffs, :document, :string
  end
end
