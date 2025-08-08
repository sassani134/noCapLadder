class Party < ApplicationRecord
  # Une participation appartient à une Party
  has_many :participations

  # Une Party a plusieurs utilisateurs à travers les participations
  has_many :users, through: :participations
end
