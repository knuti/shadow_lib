class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.references :user
      t.string     :name
      t.string     :char_class,   :limit => 20
      t.text       :description
      t.string     :race,         :limit => 10

      # attributes
      t.string     :constitution, :limit => 10
      t.string     :speed,        :limit => 10
      t.string     :strength,     :limit => 10
      t.string     :charisma,     :limit => 10
      t.string     :intelligence, :limit => 10
      t.string     :willpower,    :limit => 10
      t.decimal    :essence,      :precision => 8, :scale => 2
      t.integer    :mana,         :limit => 1
      t.string     :reaction,     :limit => 10
      t.string     :initiative,   :limit => 20

      t.text       :gear
      t.text       :cyberware
      t.text       :spells
      t.text       :weapons
      t.text       :skills
      t.text       :connections
      t.text       :other_stuff
      t.text       :armor_items
      t.integer    :ballistic_armor, :limit => 1
      t.integer    :burst_armor,     :limit => 1

      t.string     :visibility

      t.timestamps
    end

    add_index :characters, :char_class
    add_index :characters, :race
    add_index :characters, :visibility
  end
end
