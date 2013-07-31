class AddSpeciesToThing < ActiveRecord::Migration
  def change

	add_column :things, :species_id, :integer

  end
end
