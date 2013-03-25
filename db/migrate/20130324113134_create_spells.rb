class CreateSpells < ActiveRecord::Migration
  def change
    create_table :spells do |t|
      t.string :name
      t.text :description
      t.string :kind
      t.string :range
      t.string :category

      t.timestamps
    end
  end
end
