class AddDocumentToPstaffs < ActiveRecord::Migration[5.2]
  def change
    add_column :pstaffs, :document, :string
  end
end
