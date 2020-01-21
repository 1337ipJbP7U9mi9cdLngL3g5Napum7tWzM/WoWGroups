class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.belongs_to :user
      t.string :group_type
      t.boolean :private, null: false, default: false
      t.string :private_url
      t.integer :levels, array: true
      t.integer :group_size
      t.integer :group_tanks
      t.integer :group_heals
      t.integer :group_dps
      t.integer :group_accepted, array: true, default: []
      t.integer :group_declined, array: true, default: []
      t.integer :group_reserves, array: true, default: []
      t.belongs_to :server
      t.integer :faction
      t.boolean :faction_cross, null: false, default: false
      t.string :short_description
      t.boolean :active, null: false, default: false
      t.datetime :time

      t.timestamps
    end
  end
end
