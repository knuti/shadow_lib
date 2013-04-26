class CharacterSkill < ActiveRecord::Base

  attr_accessible :character_id, :skill_id, :rank, :specialization, :specialization_rank
  # set_table_name :characters_skills

  belongs_to :skill
  belongs_to :character

end

