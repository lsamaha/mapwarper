class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :encryptable
  has_many :permissions
  has_many :roles, :through => :permissions
  
  has_many :my_maps, :dependent => :destroy
  has_many :maps, -> { uniq }, :through => :my_maps
   
  #attr_accessor :password
  #attr_accessible :password_confirmation
  #attr_accessible :login, :email, :password, :description
   
  def has_role?(name)
    self.roles.find_by_name(name) ? true : false
  end
end