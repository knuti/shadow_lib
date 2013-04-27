ActiveAdmin.register Skill do
  menu label: "Skills", parent: "Shadowrun Wiki"

  filter :name
  filter :reference_attribute

  index do
    column :name
    column :description
    column :reference_attribute
  end

  show do |skill|
    attributes_table do
      row :name
      row :description
      row :reference_attribute
    end
  end

end

