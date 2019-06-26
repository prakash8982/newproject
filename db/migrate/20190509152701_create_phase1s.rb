class CreatePhase1s < ActiveRecord::Migration[5.2]
  def change
    create_table :phase1s do |t|

      t.timestamps
    end
  end
end
