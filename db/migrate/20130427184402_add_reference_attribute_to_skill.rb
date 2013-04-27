class AddReferenceAttributeToSkill < ActiveRecord::Migration
  def change
    add_column :skills, :reference_attribute, :string
  end
end
