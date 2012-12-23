class CreateShadowrules < ActiveRecord::Migration
  def change
    create_table :shadowrules do |t|
      t.string  :title, :null => false
      t.string  :excerpt
      t.text    :description
      t.integer :added_by

      t.timestamps
    end

    add_index :shadowrules, :title, :uniqe => true
  end
end
