require 'spec_helper'

describe Character do
  describe 'validations' do
    context '- invalid states:' do
      # charcter class
      %w(Zuselbusel Pinkerboy Gunsmith).each do |cc|
        it "#{cc} is an invalid char_class" do
          char = Character.make char_class: cc
          char.should_not be_valid
        end
      end

      # race
      %w(Dragon Ogre Frog).each do |r|
        it 'is not a valid race' do
          char = Character.make race: r
          char.should_not be_valid
        end
      end

      # attributes
      # %w(constitution charisma strength speed intelligence willpower).each do |atr|
      #   it "is not possible to use other special signs for #{atr}" do
      #     char = Character.make
      #     char.send("#{atr}=", "4#5/-")
      #     char.should_not be_valid
      #   end
      # end

      # integer values
      %w(mana ballistic_armor burst_armor).each do |val|
        it "is not valid to insert floating points for #{val}" do
          char = Character.make
          char.send("#{val}=", 3.5)
          char.should_not be_valid
          char.errors.messages[val.to_sym].should == ["must be an integer"]
          char.send("#{val}=", "3(4)")
          char.should_not be_valid
          char.errors.messages[val.to_sym].should == ["is not a number"]
        end
      end

      # visibility
      %w(5 demerol).each do |val|
        it "#{val} is not a visibility state" do
          char = Character.make visibility: val
          char.should_not be_valid
          char.errors.messages[:visibility].should == ["is not included in the list"]
        end
      end

    end # invalid states

    context '- valid states:' do
      # charcter class
      %w(ki-adept sorcerer shaman decker rigger aspect-wizard).each do |cc|
        it "#{cc} is a valid char_class" do
          char = Character.make char_class: cc
          char.should be_valid
        end
      end

      # race
      %w(orc dwarf elf human troll).each do |r|
        it 'is a valid race' do
          char = Character.make race: r
          char.should be_valid
        end
      end

      # attributes
      %w(constitution charisma strength speed intelligence willpower).each do |atr|
        it "is possible to use brackets for #{atr}" do
          char = Character.make
          char.send("#{atr}=", "4(5)")
          char.should be_valid
        end
      end

      # integer values
      %w(mana ballistic_armor burst_armor).each do |val|
        it "allows nil for #{val}" do
          char = Character.make
          char.send("#{val}=", nil)
          char.should be_valid
        end
      end
    end # valid states

  end # validations
end
