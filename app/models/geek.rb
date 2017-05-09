class Geek < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { in: 2..20 }
  validates :stack, presence: true
  #validates :resume, inclusion: { in: %w(true false),
  #                              message: "%{value} is not a valid resume" }
  validates_associated :applies

  has_many :applies
end
