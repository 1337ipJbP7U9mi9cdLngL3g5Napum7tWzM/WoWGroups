class CreateServers < ActiveRecord::Migration[6.0]
  def change
    create_table :servers do |t|
      t.string :name
      t.belongs_to :region

      t.timestamps
    end
  end
end
