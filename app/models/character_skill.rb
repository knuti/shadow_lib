class CharacterSkill < ActiveRecord::Base

  # set_table_name :characters_skills

  belongs_to :skill
  belongs_to :character

end

