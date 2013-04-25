class Skill < ActiveRecord::Base

  attr_accessible :name, :description

  has_many :character_skills
  has_many :characters, through: :character_skills
end

