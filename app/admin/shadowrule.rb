ActiveAdmin.register Shadowrule do

  menu label: "Explained Rules", parent: "Shadowrun Wiki", if: proc { can? :read, Shadowrule }

  index do
    column :title
    column :excerpt
    column :creator do |rule|
      AdminUser.find(rule.added_by).username
    end
    default_actions if can? :manage, Shadowrule
  end

  show do
    render "view_helper"
  end

  filter :title

  form do |f|
    f.inputs "Rule Details" do
      f.input :title
      f.input :excerpt
      f.input :description
      f.input :added_by, as: :hidden, value: current_admin_user.id
    end
    f.actions
  end
end
