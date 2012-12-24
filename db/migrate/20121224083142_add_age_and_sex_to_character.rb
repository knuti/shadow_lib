class AddAgeAndSexToCharacter < ActiveRecord::Migration
  def change
    add_column :characters, :age, :integer
    add_column :characters, :sex, :string
  end
end
