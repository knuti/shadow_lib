ActiveAdmin.register Character do

  menu label: "Characters", parent: "Shadowrun Wiki"

  index do
    column :name
    column :race
    column :char_class
    column :creator do |char|
      char.admin_user.username
    end
    column :created_at
    column :updated_at
    column :visibility
    default_actions if can? :manage, Character
  end

  filter :name
  filter :char_class
  filter :race

  form do |f|
    f.inputs "Character Details" do
      f.input :name
      f.input :race, as: :select, values: Character::CHAR_RACES
      f.input :char_class
    end
    f.actions
  end
end
