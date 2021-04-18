class Job < ApplicationRecord
  belongs_to :user
  has_many :bookings

  has_one_attached :job_image
end
