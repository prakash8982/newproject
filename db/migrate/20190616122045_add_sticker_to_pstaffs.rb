class AddStickerToPstaffs < ActiveRecord::Migration[5.2]
  def change
    add_column :pstaffs, :sticker, :string
  end
end
