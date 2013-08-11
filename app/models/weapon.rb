class Weapon < ActiveRecord::Base
  attr_accessible :damagecode, :name, :range, :camouflage, :reach, :modes, :ammunition, :modifications

  has_and_belongs_to_many :characters

  # REACH:
  # meant to be in form: short(5-10), medium(15-..)
  #
  # MODES:
  # EM/HM || EM only
end
