class Job < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { in: 2..25 }
  validates :place, presence: true
  validates :company_id, numericality: true
  #validates_associated :applies

  belongs_to :company
  has_many :applies
end
