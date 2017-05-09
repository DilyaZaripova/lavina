class Company < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { in: 2..20 }
  validates :location, presence: true
  validates_associated :jobs

  has_many :jobs
end
