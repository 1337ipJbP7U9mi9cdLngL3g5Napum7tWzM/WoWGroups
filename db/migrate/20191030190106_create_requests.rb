class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.string :character
      t.string :role
      t.integer :level
      t.belongs_to :group

      t.timestamps
    end
  end
end
