require 'machinist/active_record'

AdminUser.blueprint do
  email     { "admin@example.com"}
  password  { "foobar" }
  username  { "admin#{sn}" }
  role_bits { 1 }
end

AdminUser.blueprint(:runner) do
  email     { "runner@example.com"}
  password  { "foobar" }
  username  { "runner#{sn}" }
  role_bits { 2 }
end

Shadowrule.blueprint do
  title { "Melee Battle #{sn}" }
  excerpt { "Basics of close combat" }
  description { "1) Roll dies for weapon skill\n2) Check damage resistance" }
  added_by { AdminUser.make!.username }
end

Character.blueprint do
  creator         { AdminUser.make! }
  name            { "character#{sn}" }
  char_class      { "sorcerer" }
  description     { "super cool spell casting monster" }
  race            { "orc" }

  constitution    { "4" }
  speed           { "3" }
  strength        { "2(4)" }
  charisma        { "5" }
  intelligence    { "4" }
  willpower       { "6" }
  essence         { "6" }
  mana            { "6" }
  reaction        { "3" }
  initiative      { "1W6(2W6)" }

  gear            {}
  cyberware       {}
  spells          {}
  weapons         {}
  skills          {}
  connections     {}
  other_stuff     {}
  armor_items     {}
  ballistic_armor { 4 }
  burst_armor     { 2 }

  visibility      { "public" }
end

Spell.blueprint do
  name        { 'Sleep' }
  range       { 'touch' }
  kind        { 'mana' }
  description { 'makes a victim fall asleep' }
  category    { 'illusion' }
end

Weapon.blueprint do
  # Attributes here
end
