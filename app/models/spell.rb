class Spell < ActiveRecord::Base
  attr_accessible :category, :description, :kind, :name, :range

  SPELL_KIND = %w(mana physical)
  SPELL_RANGE = %w(touch vision)
  SPELL_CATEGORY = %w(illusion combat healing transformation manipulation)

  validates :kind, inclusion: { in: SPELL_KIND }
  validates :range, inclusion: { in: SPELL_RANGE }
  validates :category, inclusion: { in: SPELL_CATEGORY }

  has_and_belongs_to_many :characters
end

