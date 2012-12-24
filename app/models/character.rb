class Character < ActiveRecord::Base
  attr_accessible :age, :armor_items, :ballistic_armor, :burst_armor, :char_class, :charisma, :connections, :constitution, :created_at, :cyberware, :description, :essence, :gear, :initiative, :intelligence, :mana, :name, :other_stuff, :race, :reaction, :sex, :skills, :speed, :spells, :strength, :updated_at, :user_id, :visibility, :weapons, :willpower, :admin_user_id

  belongs_to :admin_user

  CHAR_ATTRIBUTES = {
    :constitution => 'KONSTITUTION',
    :speed => 'SCHNELLIGKEIT',
    :strength => 'STAERKE',
    :charisma => 'CHARISMA',
    :intelligence => 'INTELLIGENZ',
    :willpower => 'WILLENSKRAFT',
    :essence => 'ESSENZ',
    :mana => 'MAGIE'
  }

  validates :char_class, :inclusion => { :in => I18n.t('character.classes') }
  validates :race, :inclusion => { :in => I18n.t('character.races')}
  validates :visibility, :inclusion => { :in => I18n.t('character.visibility') }
  # validates :attribute, :format => { :with => /[0-9]+\(\d\)/ }, :allow_nil => true
  validates_numericality_of :mana, :ballistic_armor, :burst_armor, :greater_than => 0, :allow_nil => true, :only_integer => true

  validates_presence_of :admin_user_id, :on => :create

  scope :public_available, where(:visibility => I18n.t('character.visibility.public'))
  scope :runner_allowed, where(:visibility => I18n.t('character.visibility'))

end
