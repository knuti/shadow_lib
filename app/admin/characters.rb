ActiveAdmin.register Character do

  menu label: "Characters", parent: "Shadowrun Wiki"

  filter :name
  filter :char_class
  filter :race

  index do
    column :name
    column :race
    column :char_class
    column "created by" do |char|
      char.creator.username
    end
    column :updated_at
    column :visibility
    default_actions if can? :manage, Character
  end

  show do
    render 'listing'
  end

  form do
    render 'form'
  end
end
