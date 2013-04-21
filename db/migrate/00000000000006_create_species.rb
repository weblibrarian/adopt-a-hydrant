class CreateSpecies < ActiveRecord::Migration
  def change
    create_table :species do |t|
      t.timestamps
      t.string :name
      t.string :common_name
      t.integer :invas_rank
      t.text :notes
      t.string :sci_name
      t.string :species_code
      t.integer :species_id
    end

    add_index :species, :species_id, unique: true
  end
end
