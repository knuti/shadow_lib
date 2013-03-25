class CharactersSpells < ActiveRecord::Migration
  def change
    create_table :characters_spells do |t|
      t.references :character_id
      t.references :spell_id
    end
  end
end
