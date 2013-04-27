class Skill < ActiveRecord::Base

  attr_accessible :name, :description, :reference_attribute

  has_many :character_skills
  has_many :characters, through: :character_skills
end

