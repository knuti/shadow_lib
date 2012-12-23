class AdminUser < ActiveRecord::Base
  include Bitfields

  bitfield :role_bits,
    1 => :wizard,
    2 => :runner,
    4 => :trainee


  EMAIL_PATTERN = /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,5})$/i
  USER_PATTERN = /^[A-Za-z0-9\-_@]{4,40}$/i


  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable


  attr_accessible :email, :password, :password_confirmation, :remember_me, :role_bits, :username


  validates :password, :confirmation => true
  validates_presence_of :password, :on => :create
  validates :email, :uniqueness => true,
                    :format => { :with => EMAIL_PATTERN }
  validates :username, :format => { :with => USER_PATTERN },
                       :uniqueness => true


  before_validation do |user|
    if user.password.blank? && user.password_confirmation.blank?
      user.password = user.password_confirmation = nil
    end
  end

end
