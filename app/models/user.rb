class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :first_name, :last_name, :phone_number, message: "can't be blank"

  def full_name
    "#{first_name} #{last_name}".titleize
  end

  def is_admin?
    false
  end
  
end
