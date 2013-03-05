class Character < ActiveRecord::Base
  attr_accessible :age, :armor_items, :ballistic_armor, :burst_armor, :char_class, :charisma, :connections, :constitution, :created_at, :cyberware, :description, :essence, :gear, :initiative, :intelligence, :mana, :name, :other_stuff, :race, :reaction, :sex, :skills, :speed, :spells, :strength, :updated_at, :user_id, :visibility, :weapons, :willpower, :admin_user_id

  belongs_to :admin_user

  CHAR_CLASSES = %w(ki-adept sorcerer shaman decker rigger aspect-wizard)
  CHAR_RACES = %w(orc dwarf elf human troll)
  CHAR_VISIBILITIES = %w(public runner creator)
  CHAR_ATTRIBUTES = %w(constitution speed strength charisma intelligence willpower essence mana)

  validates :char_class, :inclusion => { :in => CHAR_CLASSES }
  validates :race, :inclusion => { :in => CHAR_RACES }
  validates :visibility, :inclusion => { :in => CHAR_VISIBILITIES }
  # validates :attribute, :format => { :with => /[0-9]+\(\d\)/ }, :allow_nil => true
  validates_numericality_of :mana, :ballistic_armor, :burst_armor, greater_than: 0, allow_nil: true, only_integer: true

  validates_presence_of :admin_user_id, on: :create

  scope :public_available, where(visibility: 'public')
  scope :runner_allowed, where(visibility: 'runner')

end
