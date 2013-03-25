ActiveAdmin.register Spell do
  menu label: "Spells", parent: "Shadowrun Wiki"

  filter :name
  filter :kind, as: :select, collection: Spell::SPELL_KIND
  filter :range, as: :select, collection: Spell::SPELL_RANGE
  filter :category, as: :select, collection: Spell::SPELL_CATEGORY

  index do
    column :name
    column :kind
    column :range
    column :category
  end

  form do
    render 'form'
  end
end

