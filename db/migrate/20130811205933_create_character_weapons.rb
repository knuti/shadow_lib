class CreateCharacterWeapons < ActiveRecord::Migration
  def change
    create_table :characters_weapons do |t|
      t.references :character
      t.references :weapon
    end
  end
end
