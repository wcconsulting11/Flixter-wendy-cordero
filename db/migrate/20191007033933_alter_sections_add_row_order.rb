class AlterSectionsAddRowOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :sections, :rank_order, :integer
    add_index :sections, :rank_order
    
  end
end
