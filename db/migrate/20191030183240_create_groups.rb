class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.belongs_to :user
      t.string :type
      t.integer :private
      t.string :private_url
      t.integer :levels, array: true
      t.integer :group_size
      t.integer :group_tanks
      t.integer :groups_heals
      t.integer :group_dps
      t.integer :group_accepted, array: true
      t.integer :group_declined, array: true
      t.integer :group_reserves, array: true
      t.belongs_to :server
      t.integer :faction
      t.integer :faction_cross
      t.text :short_description
      t.integer :active
      t.datetime :time

      t.timestamps
    end
  end
end
