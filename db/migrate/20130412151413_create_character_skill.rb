class CreateCharacterSkill < ActiveRecord::Migration
  def change
    create_table :character_skills do |t|
      t.references :character
      t.references :skill
      t.integer    :rank
      t.string     :specialization
      t.integer    :specialization_rank
    end
  end
end
