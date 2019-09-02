class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts
  has_many :audit_logs

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :first_name, :last_name, :phone_number, message: "can't be blank"
  validates :phone_number, phone: { possible: true, types: [:voip, :mobile], countries: %i(gb us) }

  def full_name
    "#{first_name} #{last_name}".titleize
  end

  def admin?
    false
  end
end
