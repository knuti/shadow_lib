class CreateWeapons < ActiveRecord::Migration
  def change
    create_table :weapons do |t|
      t.string :name
      t.string :range
      t.string :damagecode
      t.integer :camouflage
      t.string :reach
      t.string :modes
      t.string :ammunition
    end
  end
end
