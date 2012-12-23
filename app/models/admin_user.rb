class AdminUser < ActiveRecord::Base
  include Bitfields
  bitfield :role_bits,
    1 => :wizard,
    2 => :runner,
    4 => :trainee

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role_bits, :username
  # attr_accessible :title, :body

  validates :password, :confirmation => true
  validates_presence_of :password, :on => :create

  before_validation do |user|
    if user.password.blank? && user.password_confirmation.blank?
      user.password = user.password_confirmation = nil
    end
  end

end
