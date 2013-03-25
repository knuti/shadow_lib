class RemoveSpellsFromCharacter < ActiveRecord::Migration
  def change
    change_table :characters do |t|
      t.remove :spells
    end
  end
end
