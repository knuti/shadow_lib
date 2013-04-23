ActiveAdmin.register Spell do
  menu label: "Spells", parent: "Shadowrun Wiki"

  filter :name
  filter :kind, as: :select, collection: Spell::SPELL_KIND
  filter :range, as: :select, collection: Spell::SPELL_RANGE
  filter :category, as: :select, collection: Spell::SPELL_CATEGORY

  index do
    column :name do |spell|
      link_to spell.name, admin_spell_path(spell)
    end
    column :kind
    column :range
    column :category
    column 'action items' do |spell|
      link_to 'edit', edit_admin_spell_path(spell)
    end

  end

  show do
    attributes_table do
      row :name
      row :description
      row :kind
      row :range
    end
  end

  form do
    render 'form'
  end
end

