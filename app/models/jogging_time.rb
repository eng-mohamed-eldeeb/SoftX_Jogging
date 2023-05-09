class JoggingTime < ApplicationRecord
  belongs_to :user
  validates :date, presence: true
  validates :distance, presence: true
  validates :time, presence: true
end
