ActiveAdmin.register Skill do
  menu label: "Skills", parent: "Shadowrun Wiki"

  filter :name

  index do
    column :name
    column :description
  end

  show do |skill|
    attributes_table do
      row :name
      row :description
    end
  end

end

