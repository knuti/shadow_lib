ActiveAdmin.register Weapon do
  menu label: "Weapons", parent: "Shadowrun Wiki"

  filter :name

  index do
    column :name
    column :dmagecode
    default_actions if can? :manage, Weapon
  end

  # show do
  #   render 'show'
  # end

  form do
    render 'form'
  end
end
