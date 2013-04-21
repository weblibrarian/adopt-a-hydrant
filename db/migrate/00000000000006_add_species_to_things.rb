class AddSpeciesToThings < ActiveRecord::Migration
  def up
    change_table(:things) do |t|
      

      t.string :species 
    end
  end

def down
    raise ActiveRecord::IrreversibleMigration
  end
end