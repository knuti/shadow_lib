#encoding: utf-8

require 'spec_helper'

describe Shadowrule do

  describe 'validations' do

    describe ' - valid states:' do
      it 'just needs a title' do
        rule = Shadowrule.new title: 'A game rule'
        rule.should be_valid
      end
    end

    describe ' - invalid states:' do
      it 'has no title' do
        rule = Shadowrule.new title: nil
        rule.should_not be_valid
      end

      it 'has a title that is too short' do
        rule = Shadowrule.new title: 'short'
        rule.should_not be_valid
      end

      it 'has a title that is too long' do
        rule = Shadowrule.new title: (1..30).inject(""){|str, i| str.concat(i.to_s)}
        rule.should_not be_valid
      end

      it 'has a not uniqe title' do
        orig = Shadowrule.make!
        rule = Shadowrule.new title: orig.title
        rule.should_not be_valid
      end
    end
  end
end
