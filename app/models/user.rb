class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable
  
  has_many :permissions
  has_many :projects, :through=>:permissions
  
  validates :first_name, :presence=>true
  validates :last_name, :presence=>true
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name
  
  
  def name
    "#{self.last_name}, #{self.first_name} (#{self.email})"
  end
  
end
