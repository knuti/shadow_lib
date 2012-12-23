ActiveAdmin.register AdminUser do

  menu label: "Accounts", parent: "Administration", if: proc { can? :manage, AdminUser }

  index do
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
  end

  filter :email

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :role_bits #, as: :select # :check_box
    end
    f.actions
  end
end
