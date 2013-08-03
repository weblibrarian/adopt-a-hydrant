class AddAcresToThings < ActiveRecord::Migration
  def up
    change_table(:things) do |t|
      

      t.decimal :acres, :precision => 4, :scale => 3
    end
  end

def down
    raise ActiveRecord::IrreversibleMigration
  end
end
