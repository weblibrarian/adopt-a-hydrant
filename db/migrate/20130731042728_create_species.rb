class CreateSpecies < ActiveRecord::Migration
  def change
    create_table :species do |t|
      t.string :common_name
      t.integer :invasiveness_rank
      t.string :scientific_name
      t.string :code
      t.text :notes

      t.timestamps
    end
  end
end
