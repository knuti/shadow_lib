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
      f.input :race, collection: Character::CHAR_RACES
      f.input :char_class, collection: Character::CHAR_CLASSES
      f.input :age
      f.input :armor_items
      f.input :ballistic_armor
      f.input :burst_armor
      f.input :charisma
      f.input :connections
      f.input :constitution
      f.input :cyberware
      f.input :description
      f.input :essence
      f.input :gear
      f.input :initiative
      f.input :intelligence
      f.input :mana
      f.input :other_stuff
      f.input :reaction
      f.input :sex, collection: %w(male female)
      f.input :skills
      f.input :speed
      f.input :spells
      f.input :strength
      f.input :admin_user_id, as: :hidden, value: character.admin_user_id || current_admin_user.id
      f.input :visibility, collection: Character::CHAR_VISIBILITIES
      f.input :weapons
      f.input :willpower
    end
    f.actions
  end
end
