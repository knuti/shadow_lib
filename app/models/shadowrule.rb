class Shadowrule < ActiveRecord::Base
  attr_accessible :added_by, :description, :excerpt, :title

  validates :title, :presence => true,
                    :length => { :in => 6..50 },
                    :uniqueness => true
end
