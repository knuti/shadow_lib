class RenameReferenceFields < ActiveRecord::Migration
  def change
    change_table :characters_spells do |t|
      t.rename :character_id_id, :character_id
      t.rename :spell_id_id, :spell_id
    end
  end
end

