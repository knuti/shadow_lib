class Character < ActiveRecord::Base
  attr_accessible :age, :armor_items, :ballistic_armor, :burst_armor, :char_class, :charisma, :connections, :constitution, :created_at, :cyberware, :description, :essence, :gear, :initiative, :intelligence, :mana, :name, :other_stuff, :race, :reaction, :sex, :skills, :speed, :strength, :updated_at, :user_id, :visibility, :weapons, :willpower, :admin_user_id, :spell_ids, :temp_skills

  attr_accessor :temp_skills

  belongs_to :creator, class_name: AdminUser, foreign_key: 'admin_user_id'
  has_many :character_skills
  has_many :skills, through: :character_skills
  has_and_belongs_to_many :spells

  before_save :build_skills

  CHAR_CLASSES = %w(ki-adept decker rigger sorcerer shaman aspect-wizard)
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

  protected

  def build_skills
    self.temp_skills.split("\r\n").each do|char_skill|
      tmp = char_skill.gsub(/(\[|\]|\(|\))/, "").split
      if skill = Skill.find_by_name(tmp[0])
        if cs = CharacterSkill.where(skill_id: skill.id, character_id: self.id).first
          cs.update_attributes! rank: tmp[1], specialization: tmp[2], specialization_rank: tmp[3]
        else
          CharacterSkill.create! character_id: self.id, skill_id: skill.id, rank: tmp[1], specialization: tmp[2], specialization_rank: tmp[3]
        end
      else
        next
      end
    end
  end
end

