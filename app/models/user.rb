class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, { user: 0, admin: 1 }
  after_initialize :set_default_role, if: :new_record?

  # Une participation appartient à un User
  has_many :participations

  # Un User a plusieurs parties à travers les participations
  has_many :parties, through: :participations

  private

  def set_default_role
    self.role ||= :user # Set default role to 'user' if not specified
  end
end
