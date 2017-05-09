class Apply < ApplicationRecord
  validates :job_id, presence: true
  validates :geek_id, presence: true
  validates :job_id, numericality: true
  validates :geek_id, numericality: true

  belongs_to :geeks
  belongs_to :jobs
end
