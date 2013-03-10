ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => "Dashboard"

  content :title => "Shadowlib" do
    columns do
      column do
        panel "Info" do
          para "Welcome to this."
        end
      end

      column do
        panel "Public Characters" do
          ul do
            Character.public_available.each do |char|
              li link_to(char.name, admin_character_path(char))
            end
          end
        end
      end
    end

  end
end
